# frozen_string_literal: true

require_dependency "alchemy/base_record"

module Alchemy
  # The persisted version of a rendered picture variant
  #
  class PictureThumb < BaseRecord
    belongs_to :picture, class_name: "Alchemy::Picture"

    validates :signature, presence: true
    validates :uid, presence: true

    class << self
      # Upfront generation of picture thumbnails
      #
      # Called after a Alchemy::Picture has been created (after an image has been uploaded)
      #
      # Generates three types of thumbnails that are used by Alchemys picture archive and
      # persists them in the configures file store (Default Dragonfly::FileDataStore).
      #
      # @see Picture::THUMBNAIL_SIZES
      def generate_thumbs!(picture)
        Alchemy::Picture::THUMBNAIL_SIZES.values.map do |size|
          variant = Alchemy::PictureVariant.new(picture, {
            size: size,
            flatten: true,
          })
          signature = Alchemy::PictureThumb::Signature.call(variant)
          thumb = find_by(signature: signature)
          next if thumb

          uid = Alchemy::PictureThumb::Uid.call(signature, variant)
          Alchemy::PictureThumb::Create.call(variant, signature, uid)
          uid
        end
      end
    end
  end
end

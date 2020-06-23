# frozen_string_literal: true

module Alchemy
  class PictureThumb < ActiveRecord::Base
    class Uid
      # Returns a image variant uid for storage
      #
      # @param [String]
      # @param [Alchemy::PictureVariant]
      #
      # @return [String]
      def self.call(signature, variant)
        picture = variant.picture
        attachment = variant.image
        filename = attachment.name || "image"

        "pictures/#{picture.id}/#{signature}/#{filename.gsub(/[^\w.]+/, "_")}"
      end
    end
  end
end

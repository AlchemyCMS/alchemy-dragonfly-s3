# frozen_string_literal: true

require_dependency "alchemy/picture"

class Alchemy::Picture::S3Url
  attr_reader :variant

  # @param [Alchemy::PictureVariant]
  #
  def initialize(variant)
    raise ArgumentError, "Variant missing!" if variant.nil?

    @variant = variant
  end

  def call(*)
    return variant.image.remote_url unless processible_image?

    ::Dragonfly.app(:alchemy_pictures).remote_url_for(uid)
  end

  private

  def processible_image?
    variant.image.is_a?(::Dragonfly::Job)
  end

  def uid
    signature = Alchemy::PictureThumb::Signature.call(variant)
    thumb = variant.picture.thumbs.detect { |t| t.signature == signature }
    if thumb
      uid = thumb.uid
    else
      uid = Alchemy::PictureThumb::Uid.call(signature, variant)
      Alchemy::PictureThumb::Create.call(variant, signature, uid)
    end
    uid
  end
end

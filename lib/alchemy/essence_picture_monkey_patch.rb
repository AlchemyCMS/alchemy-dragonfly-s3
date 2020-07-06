# frozen_string_literal: true

module Alchemy
  module EssencePictureMonkeyPatch
    def picture_url(options = {})
      super || "missing-image.png"
    end

    def thumbnail_url(options = {})
      super || "alchemy/missing-image.svg"
    end

    def allow_image_cropping?(options = {})
      super && !!picture.image_file
    end

    EssencePicture.prepend(self)
  end
end

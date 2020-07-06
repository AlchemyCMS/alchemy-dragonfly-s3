# frozen_string_literal: true

module Alchemy
  module EssencePictureMonkeyPatch
    def picture_url(options = {})
      super || "missing-image.png"
    end

    def thumbnail_url
      super || "alchemy/missing-image.svg"
    end

    EssencePicture.prepend(self)
  end
end

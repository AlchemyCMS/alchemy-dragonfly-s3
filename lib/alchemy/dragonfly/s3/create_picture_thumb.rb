# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class CreatePictureThumb
        def self.call(variant, signature, uid)
          image = variant.image
          image.store(path: uid)
          variant.picture.thumbs.create!(
            picture: variant.picture,
            signature: signature,
            uid: uid,
          )
        end
      end
    end
  end
end

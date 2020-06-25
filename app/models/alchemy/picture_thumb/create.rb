module Alchemy
  class PictureThumb < ActiveRecord::Base
    # Stores the render result of a Alchemy::PictureVariant
    # in the Dragonfly S3 datastore
    #
    class Create
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

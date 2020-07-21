# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class CreatePictureThumb
        def self.call(variant, signature, uid)
          # create the thumb before uploading
          # to prevent db race conditions
          thumb = variant.picture.thumbs.create!(
            picture: variant.picture,
            signature: signature,
            uid: uid,
          )
          begin
            # fetch and process the image
            image = variant.image
            # upload the processed image
            image.store(path: uid)
          rescue RuntimeError, Excon::Error => e
            Rails.logger.warn(e)
            # destroy the thumb if processing or upload fails
            thumb.destroy
          end
        end
      end
    end
  end
end

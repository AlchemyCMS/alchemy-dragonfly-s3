# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class CreatePictureThumb
        def self.call(variant, signature, uid)
          # create the thumb before uploading
          # to prevent db race conditions
          thumb = nil
          if variant.picture.valid?
            thumb = Alchemy::PictureThumb.create!(
              picture: variant.picture,
              signature: signature,
              uid: uid,
            )
          end
          begin
            # fetch and process the image
            image = variant.image
            # upload the processed image
            image.store(path: uid)
          rescue RuntimeError, Excon::Error => e
            ErrorTracking.notification_handler.call(e)
            # destroy the thumb if processing or upload fails
            thumb&.destroy
          end
        end
      end
    end
  end
end

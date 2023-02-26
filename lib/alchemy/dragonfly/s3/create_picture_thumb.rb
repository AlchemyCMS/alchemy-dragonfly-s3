# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class CreatePictureThumb
        def self.call(variant, signature, uid)
          return if !variant.picture.valid?

          # create the thumb before uploading
          # to prevent db race conditions
          @thumb = Alchemy::PictureThumb.create_or_find_by!(signature: signature) do |thumb|
            thumb.picture = variant.picture
            thumb.uid = uid
          end
          begin
            # fetch and process the image
            image = variant.image
            # upload the processed image
            image.store(path: uid)
          rescue RuntimeError, Excon::Error => e
            ErrorTracking.notification_handler.call(e)
            # destroy the thumb if processing or upload fails
            @thumb&.destroy
          end
        end
      end
    end
  end
end

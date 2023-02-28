# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class Engine < ::Rails::Engine
        engine_name "alchemy_dragonfly_s3"

        config.to_prepare do
          Alchemy::Attachment.url_class = Alchemy::Attachment::S3Url
          Alchemy::Picture.url_class = Alchemy::Picture::S3Url
          Alchemy::PictureThumb.storage_class = Alchemy::Dragonfly::S3::Store
        end
      end
    end
  end
end

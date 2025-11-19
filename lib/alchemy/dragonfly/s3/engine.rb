# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class Engine < ::Rails::Engine
        engine_name "alchemy_dragonfly_s3"

        config.to_prepare do
          # Configure Alchemy to use our S3Url classes for generating urls.
          StorageAdapter::Dragonfly.attachment_url_class = AttachmentUrl
          StorageAdapter::Dragonfly.picture_url_class = PictureUrl
          PictureThumb.storage_class = Store
        end
      end
    end
  end
end

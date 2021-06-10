# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class Engine < ::Rails::Engine
        engine_name "alchemy_dragonfly_s3"

        config.to_prepare do
          Alchemy::Attachment.url_class = Alchemy::Attachment::S3Url if ::Dragonfly.app(:alchemy_attachments).datastore.is_a? ::Dragonfly::S3DataStore

          if ::Dragonfly.app(:alchemy_pictures).datastore.is_a? ::Dragonfly::S3DataStore
            Alchemy::Picture.url_class = Alchemy::Picture::S3Url
            Alchemy::PictureThumb.generator_class = Alchemy::Dragonfly::S3::CreatePictureThumb
          end
        end
      end
    end
  end
end

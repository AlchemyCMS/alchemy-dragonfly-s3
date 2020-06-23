# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class Engine < ::Rails::Engine
        engine_name "alchemy_dragonfly_s3"

        config.to_prepare do
          file = Alchemy::Dragonfly::S3::Engine.root.join("lib", "alchemy", "picture_monkey_patch.rb")
          Rails.application.config.cache_classes ? require(file) : load(file)
        end
      end
    end
  end
end

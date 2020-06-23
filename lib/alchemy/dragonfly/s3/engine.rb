# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class Engine < ::Rails::Engine
        engine_name "alchemy_dragonfly_s3"

        config.to_prepare do
          file = "alchemy/picture_monkey_patch"
          Rails.application.config.cache_classes ? require(file) : load(file)
        end
      end
    end
  end
end

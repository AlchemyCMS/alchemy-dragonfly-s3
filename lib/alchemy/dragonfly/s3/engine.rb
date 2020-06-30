# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class Engine < ::Rails::Engine
        engine_name "alchemy_dragonfly_s3"

        config.to_prepare do
          files = [
            "attachment_monkey_patch.rb",
            "picture_monkey_patch.rb",
          ].each do |filename|
            file = Alchemy::Dragonfly::S3::Engine.root.join("lib", "alchemy", filename)
            Rails.application.config.cache_classes ? require(file) : load(file)
          end
        end
      end
    end
  end
end

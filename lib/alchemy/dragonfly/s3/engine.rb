# frozen_string_literal: true

require "alchemy/version"

module Alchemy
  module Dragonfly
    module S3
      class Engine < ::Rails::Engine
        engine_name "alchemy_dragonfly_s3"

        initializer "alchemy_dragonfly_s3.assets" do
          Rails.application.config.assets.precompile << "alchemy_dragonfly_s3_manifest.js"
        end

        config.to_prepare do
          [
            "attachment_monkey_patch.rb",
            "picture_monkey_patch.rb",
            "essence_picture_monkey_patch.rb",
          ].each do |filename|
            file = Alchemy::Dragonfly::S3::Engine.root.join("lib", "alchemy", filename)
            Rails.application.config.cache_classes ? require(file) : load(file)
          end
        end

        if Gem::Version.new(Alchemy.version) < Gem::Version.new("4.1")
          paths["app/models"] << root.join("lib", "models")
        end
      end
    end
  end
end

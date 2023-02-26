# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class Store
        def self.call(variant, uid)
          # download and process the image
          image = variant.image
          # upload the processed image
          image.store(path: uid)
        end
      end
    end
  end
end

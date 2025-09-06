# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class PictureUrl < StorageAdapter::Dragonfly::PictureUrl
        def call(variant_options = {})
          set_variant(variant_options)
          return variant.image.remote_url unless processible_image?

          ::Dragonfly.app(:alchemy_pictures).remote_url_for(uid)
        end
      end
    end
  end
end

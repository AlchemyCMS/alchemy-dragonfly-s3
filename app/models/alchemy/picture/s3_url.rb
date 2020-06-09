# frozen_string_literal: true

module Alchemy
  class Picture < BaseRecord
    class S3Url < Url
      def call(*)
        return variant.image.remote_url unless processible_image?

        ::Dragonfly.app(:alchemy_pictures).remote_url_for(uid)
      end
    end
  end
end

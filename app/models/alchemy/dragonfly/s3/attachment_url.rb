# frozen_string_literal: true

module Alchemy
  module Dragonfly
    module S3
      class AttachmentUrl < StorageAdapter::Dragonfly::AttachmentUrl
        def call(*)
          attachment.file&.remote_url
        end
      end
    end
  end
end

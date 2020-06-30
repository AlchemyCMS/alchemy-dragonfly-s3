# frozen_string_literal: true

module Alchemy
  module AttachmentMonkeyPatch
    def url
      if file
        Alchemy::Attachment::S3Url.call(self)
      end
    end

    Attachment.prepend(self)
  end
end

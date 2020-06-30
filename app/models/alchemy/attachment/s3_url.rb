# frozen_string_literal: true

module Alchemy
  class Attachment < BaseRecord
    class S3Url < Url
      def call(*)
        @attachment.file.remote_url
      end
    end
  end
end

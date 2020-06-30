# frozen_string_literal: true

module Alchemy
  class Attachment < ActiveRecord::Base
    class S3Url
      def self.call(attachment)
        attachment.file.remote_url
      end
    end
  end
end

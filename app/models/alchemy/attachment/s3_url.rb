# frozen_string_literal: true

require_dependency "alchemy/attachment"

class Alchemy::Attachment::S3Url
  def self.call(attachment)
    attachment.file.remote_url
  end
end

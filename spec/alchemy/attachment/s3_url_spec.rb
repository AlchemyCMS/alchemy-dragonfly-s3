# frozen_string_literal: true

require "rails_helper"
require "alchemy/test_support/factories/attachment_factory"

RSpec.describe Alchemy::Attachment::S3Url do
  let(:attachment) { FactoryBot.create(:alchemy_attachment) }

  subject { described_class.new(attachment).call }

  it "returns the remote url to the file" do
    is_expected.to match(/http\:\/\/test-bucket.s3.amazonaws.com\/.+\/image\.png/)
  end
end

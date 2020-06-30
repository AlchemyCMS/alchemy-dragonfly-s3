require "rails_helper"
require "alchemy/test_support/factories/attachment_factory"

RSpec.describe Alchemy::Attachment, type: :model do
  before { Fog.mock! }

  describe "#url" do
    subject { attachment.url }

    context "without file" do
      let(:attachment) { described_class.new }

      it { is_expected.to be_nil }
    end

    context "with file" do
      let(:attachment) { FactoryBot.create(:alchemy_attachment) }

      it "returns url to file in S3 bucket" do
        is_expected.to match "http://test-bucket.s3.amazonaws.com/.+/image.png"
      end
    end
  end
end

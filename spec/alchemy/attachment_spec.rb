# frozen_string_literal: true

require "rails_helper"
require "alchemy/test_support/factories/attachment_factory"

RSpec.describe Alchemy::Attachment do
  describe "#url" do
    subject { attachment.url }

    context "without file" do
      let(:attachment) { described_class.new }

      it { is_expected.to be_nil }
    end

    context "with file" do
      let(:attachment) { FactoryBot.create(:alchemy_attachment) }

      it "returns remote url" do
        is_expected.to match(/http\:\/\/test-bucket.s3.amazonaws.com\/.+\/image\.png/)
      end

      context "with additional arguments" do
        subject { attachment.url(something: "foo") }

        it "drops them" do
          is_expected.to_not match(/something=foo/)
        end
      end
    end
  end
end

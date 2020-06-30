# frozen_string_literal: true

require "rails_helper"
require "alchemy/test_support/factories/picture_factory"

RSpec.describe Alchemy::Picture do
  describe "#url" do
    subject { picture.url }

    context "without file" do
      let(:picture) { described_class.new }

      it { is_expected.to be_nil }
    end

    context "with file" do
      let(:picture) { FactoryBot.create(:alchemy_picture) }

      it "returns remote url" do
        is_expected.to match(/http\:\/\/test-bucket.s3.amazonaws.com\/.+\/image\.png/)
      end

      context "with additional arguments" do
        subject { picture.url(something: "foo") }

        it "drops them" do
          is_expected.to_not match(/something=foo/)
        end
      end
    end
  end
end

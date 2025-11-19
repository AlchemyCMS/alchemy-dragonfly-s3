# frozen_string_literal: true

require "rails_helper"

RSpec.describe Alchemy::Dragonfly::S3::PictureUrl do
  let(:picture) { FactoryBot.create(:alchemy_picture) }
  let(:variant_options) { {} }

  subject { described_class.new(picture).call(variant_options) }

  it "returns the remote url to the image" do
    is_expected.to match(/http:\/\/test-bucket.s3.amazonaws.com\/.+\/image\.png/)
  end

  context "with a processed variant" do
    let(:variant_options) { {size: "10x10"} }

    it "returns the remote url to the thumbnail" do
      is_expected.to match(/http:\/\/test-bucket.s3.amazonaws.com\/pictures\/\d+\/.+\/image\.png/)
    end
  end
end

# frozen_string_literal: true

require "rails_helper"
require "alchemy/test_support/factories/picture_factory"

RSpec.describe Alchemy::Picture::S3Url do
  let(:image) { File.new(File.expand_path("../../fixtures/image.png", __dir__)) }
  let(:picture) { FactoryGirl.create(:alchemy_picture, image_file: image) }
  let(:variant) { Alchemy::PictureVariant.new(picture) }
  let(:params) { {} }

  subject { described_class.new(variant).call }

  it "returns the remote url to the image" do
    is_expected.to match(/http\:\/\/test-bucket.s3.amazonaws.com\/.+\/image\.png/)
  end

  context "with a processed variant" do
    let(:variant) { Alchemy::PictureVariant.new(picture, { size: "10x10" }) }

    it "returns the remote url to the thumbnail" do
      is_expected.to match(/http\:\/\/test-bucket.s3.amazonaws.com\/pictures\/\d+\/.+\/image\.png/)
    end
  end
end

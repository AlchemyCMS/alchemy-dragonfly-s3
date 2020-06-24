# frozen_string_literal: true

require "rails_helper"
require "alchemy/test_support/factories/picture_factory"

RSpec.describe Alchemy::Picture do
  let(:image) { File.new(File.expand_path("../fixtures/image.png", __dir__)) }
  let(:picture) { FactoryBot.create(:alchemy_picture, image_file: image) }

  it "generates thumbnails after create" do
    expect {
      FactoryBot.create(:alchemy_picture)
    }.to change { Alchemy::PictureThumb.count }.by(3)
  end

  describe "#url" do
    subject { picture.url }

    it "returns the remote url to the image" do
      is_expected.to match(/http\:\/\/test-bucket.s3.amazonaws.com\/.+\/image\.png/)
    end
  end
end

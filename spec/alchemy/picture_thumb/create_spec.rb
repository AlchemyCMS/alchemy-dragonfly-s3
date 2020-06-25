# frozen_string_literal: true

require "rails_helper"
require "alchemy/test_support/factories/picture_factory"

RSpec.describe Alchemy::PictureThumb::Create do
  let(:image) { File.new(File.expand_path("../../fixtures/image.png", __dir__)) }
  let(:picture) { FactoryBot.create(:alchemy_picture, image_file: image) }
  let(:variant) { Alchemy::PictureVariant.new(picture, { size: "1x1" }) }

  before do
    Fog.mock!
  end

  it "creates thumb on picture thumbs collection" do
    expect {
      Alchemy::PictureThumb::Create.call(variant, "1234", "/foo/baz")
    }.to change { variant.picture.thumbs.length }.by(1)
  end
end

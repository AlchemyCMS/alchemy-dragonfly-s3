# frozen_string_literal: true

require "rails_helper"

RSpec.describe Alchemy::Dragonfly::S3::Store do
  let(:picture) { FactoryBot.create(:alchemy_picture) }
  let!(:variant) { Alchemy::PictureVariant.new(picture, {size: "1x1"}) }

  before do
    Fog.mock!
  end

  it "stores file" do
    expect_any_instance_of(::Dragonfly::Job).to receive(:store).with(path: "/foo/baz")
    described_class.call(variant, "/foo/baz")
  end
end

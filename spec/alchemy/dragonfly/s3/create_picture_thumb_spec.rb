# frozen_string_literal: true

require "rails_helper"

RSpec.describe Alchemy::Dragonfly::S3::CreatePictureThumb do
  let(:image) { File.new(File.expand_path("../../../fixtures/image.png", __dir__)) }
  let(:picture) { FactoryBot.create(:alchemy_picture, image_file: image) }
  let(:variant) { Alchemy::PictureVariant.new(picture, { size: "1x1" }) }

  before do
    Fog.mock!
  end

  subject do
    described_class.call(variant, "1234", "/foo/baz")
  end

  it "creates thumb on picture thumbs collection" do
    expect { subject }.to change { variant.picture.thumbs.reload.length }.by(1)
  end

  context "with an invalid picture" do
    let(:picture) { FactoryBot.build(:alchemy_picture) }

    it "does not create a thumb" do
      expect(picture).to receive(:valid?) { false }
      expect { subject }.not_to change { variant.picture.thumbs.reload.length }
    end
  end

  context "on processing errors" do
    before do
      variant
      expect(variant).to receive(:image) do
        raise(Dragonfly::Job::Fetch::NotFound)
      end
    end

    it "destroys thumbnail" do
      expect { subject }.to_not change { variant.picture.thumbs.reload.length }
    end
  end

  context "on connection errors" do
    before do
      variant
      expect_any_instance_of(Dragonfly::Content).to receive(:store) do
        raise(Excon::Error::Timeout)
      end
    end

    it "destroys thumbnail" do
      expect { subject }.to_not change { variant.picture.thumbs.reload.length }
    end
  end
end

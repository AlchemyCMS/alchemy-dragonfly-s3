# frozen_string_literal: true

require "rails_helper"

RSpec.describe Alchemy::EssencePicture do
  let(:picture) { Alchemy::Picture.new }
  let(:content) { Alchemy::Content.new }
  let(:essence_picture) { described_class.new(picture: picture, content: content) }

  describe "#picture_url" do
    subject { essence_picture.picture_url }

    context "if picture.url returns nil" do
      before do
        expect(picture).to receive(:url) { nil }
      end

      it "returns missing image url" do
        is_expected.to eq "missing-image.png"
      end
    end
  end

  describe "#thumbnail_url" do
    subject { essence_picture.thumbnail_url }

    context "if picture.url returns nil" do
      before do
        expect(picture).to receive(:url) { nil }
      end

      it "returns missing image url" do
        is_expected.to eq "alchemy/missing-image.svg"
      end
    end
  end

  describe "#allow_image_cropping?" do
    subject { essence_picture.allow_image_cropping? }

    context "if picture.image_file is nil" do
      before do
        expect(content).to receive(:settings_value).at_least(:once) { true }
        expect(picture).to receive(:image_file) { nil }
      end

      it { is_expected.to be(false) }
    end
  end
end

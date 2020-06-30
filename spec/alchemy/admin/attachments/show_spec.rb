# frozen_string_literal: true

require "rails_helper"
require "alchemy/test_support/factories/attachment_factory"

RSpec.describe "alchemy/admin/attachments/show.html.erb", type: :view do
  let(:attachment) do
    FactoryGirl.create(:alchemy_attachment)
  end

  it "displays remote url to file in S3 bucket" do
    assign(:attachment, attachment)
    render
    aggregate_failures do
      expect(rendered).to have_selector('label:contains("URL") + p:contains("http://test-bucket.s3.amazonaws.com")')
      expect(rendered).to have_selector('label:contains("Download-URL") + p:contains("http://test-bucket.s3.amazonaws.com")')
      expect(rendered).to have_selector('img[src^="http://test-bucket.s3.amazonaws.com"]')
    end
  end
end

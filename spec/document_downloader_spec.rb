require 'spec_helper'
require_relative '../lib/document_downloader'

describe MacbethAnalyzer::DocumentDownloader do
  subject(:doc){ MacbethAnalyzer::DocumentDownloader.new(url) }
  let(:url) { "http://www.example.com/" }
  let(:body) { "<xml></xml>" }

  before(:each) do
    stub_request(:get, url).to_return(:body => body)
  end

  it { expect(subject.url).to eq(url) }

  describe "#request_document" do
    it "returns body of requested page" do
      expect(subject.request_document).to eq(body)
    end
  end
end

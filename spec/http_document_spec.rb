require 'spec_helper'
require_relative '../lib/http_document'

describe MacbethAnalyzer::HTTPDocument do
  subject(:doc){ MacbethAnalyzer::HTTPDocument.new(url) }
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

  describe "#as_xml" do
    it "returns xml document" do
      expect(subject.as_xml).to be_an(Nokogiri::XML::Document)
    end
  end
end

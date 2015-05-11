require 'spec_helper'
require_relative '../lib/macbeth_analyzer/document'

describe MacbethAnalyzer::Document do
  subject(:doc){ MacbethAnalyzer::Document.new(path) }
  let(:path) { "http://www.example.com/" }
  let(:body) { "<xml></xml>" }
  let(:success) { Net::HTTPSuccess.new}

  before(:each) do
    stub_request(:get, path).to_return(:body => body)
  end

  it { expect(subject.path).to eq(path) }

  describe "#request_document" do
    it "returns body of requested page" do
      expect(subject.doc).to eq(body)
    end
  end

  describe "#as_xml" do
    it { expect(subject.as_xml).to be_an(Nokogiri::XML::Document) }
  end
end

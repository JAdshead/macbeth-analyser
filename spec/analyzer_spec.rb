require 'spec_helper'
require_relative '../lib/analyzer'
require 'nokogiri'

include XmlGenerator

describe MacbethAnalyzer::Analyzer do
  subject(:analyzer) { MacbethAnalyzer::Analyzer.new }
  let(:macbeth) { XmlGenerator.generate_xml(speech: {"bob" => ["hello", "world", "Jon"], "witch" => ["Here are words."]})}
  let(:macbeth_xml) { Nokogiri::XML(macbeth) }
  let(:url) { 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml' }

  before(:each) do
    stub_request(:get, url).to_return(:body => macbeth)
  end

  describe "#analyze" do
    it "counts each characters lines" do
      allow_any_instance_of(MacbethAnalyzer::HTTPDocument).to receive(:as_xml).and_return(macbeth_xml)
      count = { 'bob' => 3, 'witch' => 1}
      subject.analyze
      expect(subject.result).to eq(count)
    end

    it "does not count all" do
      subject.analyze
      expect(subject.result.include?('all')).to be_falsey
    end
  end
end


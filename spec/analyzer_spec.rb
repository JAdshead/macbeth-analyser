require 'spec_helper'
require_relative '../lib/macbeth_analyzer/analyzer'
require 'nokogiri'

include DocGenerator

describe MacbethAnalyzer::Analyzer do
  subject(:analyzer) { MacbethAnalyzer::Analyzer.new(xml_macbeth) }
  let(:macbeth) { DocGenerator.generate_doc(speech: {"bob" => ["hello", "world", "Jon"], "witch" => ["Here are words."]})}
  let(:xml_macbeth) { Nokogiri::XML(macbeth) }
  let(:url) { 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml' }

  before(:each) do
    stub_request(:get, url).to_return(:body => macbeth)
  end

  describe "#analyze" do
    it "counts each characters lines" do
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


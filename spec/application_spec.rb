require 'spec_helper'
require_relative '../lib/macbeth_analyzer/application'
require 'nokogiri'

describe MacbethAnalyzer::Application do
  subject(:app) { MacbethAnalyzer::Application.new }
  let(:analysis) { {"Bob" => 5} }
  let(:doc)  { double("Document", :as_xml => :expected_xml) }
  let(:analyzer) { double("Analyzer", :result => :expected_result) }

  before(:each) do
    allow(MacbethAnalyzer::Document).to receive(:new).and_return(doc)
    allow(MacbethAnalyzer::Analyzer).to receive(:new).with(:expected_xml).and_return(analyzer)
  end

  it "sets document" do
    expect(app.doc).to eq(doc)
    expect(app.analysis).to eq(:expected_result)
  end

  describe "#titleize" do
    it { expect(app.titleize("CHEESE")).to eq("Cheese") }
    it { expect(app.titleize("hello world")).to eq("Hello World") }
  end

  describe "#print_hash" do
    it "prints to STDOUT" do
      expect(STDOUT).to receive(:puts).exactly(3).times
      app.print_hash(analysis)
    end
  end

end

require 'spec_helper'
require_relative '../lib/application'

describe MacbethAnalyzer::Application do
  subject(:app) { MacbethAnalyzer::Application.new }
  let(:analysis) { {"Bob" => 5} }

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

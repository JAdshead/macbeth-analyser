require 'spec_helper'
require_relative '../lib/macbeth_analyzer'

describe MacbethAnalyzer do
  subject(:analyzer) { MacbethAnalyzer.new }
  let(:macbeth) { get_macbeth }

  describe "#get_macbeth" do
    it "should pull macbeth from url" do
      allow(Net::HTTP).to receive(:get).and_return(macbeth)
      expect(subject.get_macbeth).to eq(macbeth)
    end
  end

  describe "#count_lines" do
    it "counts each characters lines" do
      allow(Net::HTTP).to receive(:get).and_return(macbeth)

      count = { 'Bob' => 3, 'Witch' => 2 }
      subject.count_lines
      expect(subject.char_line_count).to eq(count)
    end

    it "does not count all" do
      allow(Net::HTTP).to receive(:get).and_return(macbeth)
      subject.count_lines
      expect(subject.char_line_count.include?('all')).to be_falsey
    end
  end
end


def get_macbeth
  xml = %(
    <PLAY>
     <TITLE>The Tragedy of Macbeth</TITLE>
        <ACT>
          <SCENE>
            <SPEECH>
              <SPEAKER>Bob</SPEAKER>
              <LINE>I dont exists in this play</LINE>
              <LINE>erm..hello</LINE>
            </SPEECH>
            <SPEECH>
              <SPEAKER>Witch</SPEAKER>
              <LINE>When shall we three meet again</LINE>
              <LINE>In thunder, lightning, or in rain?</LINE>
            </SPEECH>
            <SPEECH>
              <SPEAKER>Bob</SPEAKER>
              <LINE>Seriously I dont belong here...</LINE>
            </SPEECH>
            <SPEECH>
              <SPEAKER>ALL</SPEAKER>
              <LINE>WE ARE ALL TALLKING<LINE>
            </SPEECH>
          </SCENE>
        </ACT>
    </PLAY>
  )
end

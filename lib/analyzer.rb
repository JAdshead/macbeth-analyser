require 'nokogiri'

module MacbethAnalyzer
  class Analyzer
    attr_reader :result

    def initialize(doc)
      @doc = to_xml(doc)
      @result = Hash.new(0)
    end

    def to_xml(doc)
      Nokogiri::XML(doc)
    end

    def analyze
      @result = Hash.new(0)
      @doc.css('SPEECH').each do |speech|
        next if speech.css("SPEAKER").text == 'ALL'
        char = speech.css("SPEAKER").text
        count = speech.css("LINE").size
        @result[char] += count
      end
      @result
    end

  end
end

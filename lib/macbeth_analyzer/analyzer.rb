require 'nokogiri'

module MacbethAnalyzer
  class Analyzer
    attr_writer :result
    attr_reader :doc

    def initialize(doc)
      @doc = doc
      reset_result
    end

    def analyze
      reset_result
      @doc.css('SPEECH').each do |speech|
        next if speech.css("SPEAKER").text == 'ALL'
        char = speech.css("SPEAKER").text
        count = speech.css("LINE").size
        @result[char] += count
      end
      @result
    end

    def result
      @result.empty? ? @result = analyze : @result
    end

    def reset_result
      self.result = Hash.new(0)
    end

  end
end

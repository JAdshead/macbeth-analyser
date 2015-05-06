require_relative 'http_document'

module MacbethAnalyzer
  class Analyzer
    MACBETH_URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

    attr_reader :result

    def initialize
      @doc = (HTTPDocument.new(MACBETH_URL).as_xml)
      @result = Hash.new(0)
    end

    def analyze
      @result = Hash.new(0)
      @doc.css('SPEECH').each do |speech|
        next if speech.css("SPEAKER").text == 'ALL'
        char = speech.css("SPEAKER").text
        count = speech.css("LINE").size
        @result[char] += count
      end
      self
    end

    def print_result
      @result.each do |key, value|
        print "#{key.to_s} #{value.to_s} \n"
      end
    end
  end
end

class MacbethAnalyzer
  require 'net/http'
  require 'nokogiri'

  MACBETH_URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

  attr_accessor :doc, :char_line_count

  def initialize
    @doc = Nokogiri::XML(get_macbeth)
    @char_line_count = Hash.new(0)
  end

  def get_macbeth
    uri = URI(MACBETH_URL)
    @response = Net::HTTP.get(uri)
  end

  def count_lines
    @char_line_count = Hash.new(0)
    @doc.css('SPEECH').each do |speech|
      next if speech.css("SPEAKER").text == "ALL"
      char = speech.css("SPEAKER").text
      count = speech.css("LINE").size
      @char_line_count[char] += count
    end
    self
  end

  def print_lines
    @char_line_count.each do |key, value|
      puts key.to_s + " " + value.to_s + "\n"
    end
  end
end

# analyzer = MacbethAnalyzer.new
# analyzer.count_lines
# analyzer.print_lines


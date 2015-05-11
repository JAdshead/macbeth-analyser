require_relative 'analyzer'
require_relative 'document'

module MacbethAnalyzer
  class Application
    MACBETH_URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

    attr_reader :doc, :analysis

    def initialize
      @doc = Document.new(MACBETH_URL)
      @analysis = Analyzer.new(@doc.as_xml).result
    end

    def run
      print_hash(@analysis)
    end

    def print_hash(hash)
      hash.each do |key, value|
        puts "Character: #{titleize(key.to_s)} "
        puts "Lines:     #{value.to_s}"
        puts
      end
    end

    def titleize(string)
      string.split(/(\W)+/).map(&:capitalize).join
    end
  end
end

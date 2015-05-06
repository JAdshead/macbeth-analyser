require_relative 'analyzer'
require_relative 'document_downloader'

module MacbethAnalyzer
  class Application
    MACBETH_URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

    def run
      doc = DocumentDownloader.new(MACBETH_URL).doc
      analysis = Analyzer.new(doc).analyze
      print_hash(analysis)
    end

    def print_hash(hash)
      hash.each do |key, value|
        puts "Character: #{titleize(key.to_s)} "
        puts "Lines:     #{value.to_s}"
        puts
      end
    end

    def titleize(string)
      string.split(/(\W)/).map(&:capitalize).join
    end
  end
end

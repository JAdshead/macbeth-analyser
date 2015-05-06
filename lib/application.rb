require_relative 'analyzer'
# require_relative 'http_document'

module MacbethAnalyzer
  class Application
    def initialize(*argv)
      @args = argv
    end

    def run
      analyzer = Analyzer.new
      analyzer.analyze
      analyzer.print_result
    end
  end
end

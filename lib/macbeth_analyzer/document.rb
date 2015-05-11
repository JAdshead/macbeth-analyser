require 'net/http'
require 'nokogiri'

module MacbethAnalyzer
  class Document
    attr_accessor :doc
    attr_reader :path

    def initialize(path)
      self.path = path
    end
    
    def path=(path)
      if path =~ /^http/
        self.path_from_url = path
      else
        @path = path
      end
    end

    def as_xml
      Nokogiri::XML(self.doc)
    end

    def path_from_url=(path)
      uri = URI(path)
      response = Net::HTTP.get_response(uri)
      if response.code == "200" # .is_a?(Net::HTTPSuccess)
        self.doc = response.body
        @path = path
      else
        raise "can't reach url: #{path}"
      end
    end

  end
end

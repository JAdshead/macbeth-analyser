require 'net/http'
require 'nokogiri'

module MacbethAnalyzer
  class HTTPDocument
    attr_accessor :url, :doc

    def initialize(url)
      @url  = url
      @doc   = request_document
    end

    def as_xml
      Nokogiri::XML(@doc)
    end

    def request_document
      uri = URI(@url)
      response = Net::HTTP.get_response(uri)
      response.body if response.is_a?(Net::HTTPSuccess)
    end
  end
end

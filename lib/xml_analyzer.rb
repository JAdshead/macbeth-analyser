class XmlAnalyzer

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

end

require 'erb'

module XmlGenerator

  def generate_xml(speech:)
    ERB.new(template).result(binding)
  end

  def template
    %(
    <PLAY>
     <TITLE>The Tragedy of Macbeth</TITLE>
        <ACT>
          <SCENE>
            <% speech.each do |speaker, lines| %>
              <SPEECH>
                <SPEAKER><%= speaker  %></SPEAKER>
                <% lines.each do |line| %>
                  <LINE><%= line %> </LINE>
                <% end %>
              </SPEECH>
            <% end %>
          </SCENE>
        </ACT>
    </PLAY>
    )
  end
end

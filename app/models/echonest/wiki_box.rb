module Echonest

  module WikiBox

    def scrape_wiki_page(value)
      url = "http://en.wikipedia.org/wiki/#{value}_(band)"
      binding.pry
      doc = Nokogiri::HTML(open(url))
      infobox = doc.at("table[class='infobox vcard']")
      bindnig.pry
      infobox_caption = infobox.at('caption').text
      uri = URI.parse(url)
      infobox_agents = Hash[ *infobox.search('td.agent a').map{ |a| [ a.text, uri.merge(a['href']).to_s ] }.flatten ]
      # require 'ap'
      # ap infobox_caption
      # ap infobox_agents
    end
  
  end
end
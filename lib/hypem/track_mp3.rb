require 'nokogiri'
require 'json'

module Hypem
  class TrackMp3
    include Helper
    
    def initialize(media_id)
      @media_id = media_id
    end

    def get
      key, cookie = key_request()
      response = HTTParty.get("http://hypem.com/serve/source/#{@media_id}/#{key}", :headers=> {"cookie" => cookie})   
      json = JSON.parse(response.body)
      json['url']
    end
    
    def key_request
      response = Hypem::Request.get("/playlist/item/#{@media_id}")
      cookie = response.headers["set-cookie"]
      doc = ::Nokogiri::HTML(response.body)

      json = JSON.parse(doc.css('#displayList-data').text())
      key = json['tracks'][0]['key']
      return key, cookie
    end
    
  end
end
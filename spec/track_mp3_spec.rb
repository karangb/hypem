require 'spec_helper'

describe Hypem::TrackMp3 do

  describe "#get" do
    it "should pass" do
      VCR.use_cassette('track_html') do

        key = described_class.new('1jsw9').get()
        key.should == 'http://api.soundcloud.com/tracks/38758367/stream?consumer_key=nH8p0jYOkoVEZgJukRlG6w'
      end
      
    end
  end
end

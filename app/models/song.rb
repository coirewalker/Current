class Song < ActiveRecord::Base
	belongs_to :artist
	CLIENT = Soundcloud.new(:client_id => '6cd1f51e6347887c078767d1780aad07',
                      :client_secret => ENV['SOUNDCLOUD_APIKEY'])

  def stream_location
  	CLIENT.get_song_location(self)
  end

end


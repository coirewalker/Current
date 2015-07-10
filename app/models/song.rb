class Song < ActiveRecord::Base
	belongs_to :artist


	# def sc_player
	# "<iframe width='100%' height='20px' background-size='contain' scrolling='no' frameborder='no' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{self.soundcloud_id}&amp;auto_play=true&amp;hide_related=true&amp;show_comments=true&amp;show_user=false&amp;show_reposts=false&amp;visual=false'></iframe>"
 #  end

  def stream_location
  	SoundCloud.get_song_location(self)
  end

end


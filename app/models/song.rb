class Song < ActiveRecord::Base
	belongs_to :artist


	def sc_player
	"<iframe width='400px' height='80px' scrolling='no' frameborder='no' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{self.soundcloud_id}&amp;auto_play=true&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true'></iframe>"
  end

end
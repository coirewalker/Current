class HomeController < ApplicationController

	def home
	end

	def show
  	@events = JamBase.upcoming_events(1, params[:users_zip])
    @tracks = []
  	@events.map do |event|
  		if event[:artists]
	  		event[:artists].map do |artist|
	  			@tracks << artist[:artist].songs.first.soundcloud_id.to_i if artist[:artist].songs.any? and artist[:artist].songs.first.soundcloud_id #and [:venue]["Name"].first

	  		end
	  	end
  	end

	end

end


























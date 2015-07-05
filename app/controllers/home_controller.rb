class HomeController < ApplicationController

	def home
		
	end

	def show
  	@events = JamBase.upcoming_events(1, params[:zipcode])
  	# playlist
  	@tracks = []
  	@events.map do |event|
  		if event[:artists]
	  		event[:artists].map do |artist|
	  			@tracks << artist[:artist].songs.first.soundcloud_id.to_i if artist[:artist].songs.any? and artist[:artist].songs.first.soundcloud_id
	  		end
	  	end
  	end

  	# @events = JamBase.upcoming_events(1, params[:zipcode])
  	# @venue_name = [] # parallel array to @tracks--not ideal but worth a shot
  	# @events.map do |event|
  	# 	if event[:venue]
	  # 		event[:venue].map do |venue|
	  # 			@venue_name << [:venue].name.first if @tracks
	  # 		end
	  # 	end
  	# end

	end
	
end

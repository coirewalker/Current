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


  	invalid_sc_id = eventsTest.([artist artist:, "soundcloud_id" :null])
  		if @eventsTest = @invalid_sc_id
  			do not add to scTracks array
  			else
  				ignore invalid_sc_id
  			end
  		end






  	# how to keep venue name and @track connected?  seperate arrays?  Will that guarantee a parallel order so the venue name and artist name from the jambase API match? 
  # 	puts "*" * 40
  # 	puts @events.first
  # 	@location = []
		# location = Venue.find_by(name: event["Venue"]["Name"])
		# unless @location
		# 	@location = Venue.find_by(name: event["Venue"]["Name"])
  # 	end	 
	end

end

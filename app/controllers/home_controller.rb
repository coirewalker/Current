class HomeController < ApplicationController

	def home
		
	end

	def show
  	@events = JamBase.upcoming_events(1, params[:zipcode])
  	# puts @events
		# @player = SoundCloud.get_artist("beck")
	end

end

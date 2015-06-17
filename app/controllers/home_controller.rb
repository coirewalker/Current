class HomeController < ApplicationController

	def home

	end

	def show
  	start_time = Time.now.strftime("%FT%H:%M:%S") 
		end_time = (Time.now + 20.days).strftime("%FT%H:%M:%S") 

  	users_zip = params[:users_zip]
		uri = URI("http://api.jambase.com/events?zipCode=#{users_zip}&radius=10&startDate=#{start_time}&endDate=#{end_time}&page=0&api_key=pedaafhf7xkuaegea2nmrmjs")
		response = JSON.parse(Net::HTTP.get(uri))
		@eligible_local_artist = response["Events"]
		puts @eligible_local_artist
		# puts uri
		spotify_artist
	end

private
	def spotify_artist
		name = @eligible_local_artist[0]["Artists"][0]["Name"]
		puts "********** #{name} **********"
		@playlist = RSpotify::Artist.search(CGI::escape name)	
	end

	def spotify_complile_playlist
	 	@playlist.each do |track|
	 		track[""] #array...
	 	end
	end

	def spotify_complete_playlist
		@spotify_complile_playlist = params[:spotify_complile_playlist]
		# uri = URI(spotify playlist uri...)
	end

end

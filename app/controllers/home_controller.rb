require 'uri'
require 'net/http'
require 'json'

class HomeController < ApplicationController

	def home
	end

	def show
  	@events = JamBase.upcoming_events(2, params[:zipcode])
  	# puts @events
		# @player = SoundCloud.get_artist("beck")
	end


private

	# def get_echo_artist(artist) 
	# #puts jambase artist name into echo nest api search
	# 	uri = URI("http://developer.echonest.com/api/v4/playlist/static?api_key=GY2PWSC90XLRX2SNR&artist=#{CGI::escape artist}&format=json&results=20&type=artist")
	# 	begin
	# 		response = JSON.parse(Net::HTTP.get(uri))
	# 		response["response"]["songs"][0]["title"]
	# 	rescue
	# 		"There was a problem"
	# 	end

	# end

end

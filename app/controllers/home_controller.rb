class HomeController < ApplicationController

	def home
	end

	def show
  	@events = JamBase.upcoming_events(2, params[:zipcode])
  	# puts @events
		# @player = SoundCloud.get_artist("beck")
	end

	# def create_playlist
 #  # @track = @get_artist.find_by(params(artist [:name], event[:venue]))
 #  track = @get_artist.first
 #  if @track.blank?
 #    respond_to do |format|
 #    format.html { redirect_to root_path, notice:'There was a problem creating your playlist.  Please try again later :(' }
 #    end 
 #  else
 #    @track.save 
 #    respond_to do |format|
 #      format.html { redirect_to show_path,notice: 'Your playlist of local music was successfully created :)' }
 #    end
 # end

end

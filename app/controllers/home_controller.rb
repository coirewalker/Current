class HomeController < ApplicationController

	def home
		
	end

	def show
  	@events = JamBase.upcoming_events(1, params[:zipcode])
  	# if params[:user_zip].count != 5 
  		

  	# if @events == params[:user_zip]
  	# 	session[:user_id] = @user.id
  	# 	redirect_to index_path
  	# 	flash[:alert] = "There was a problem with your zipcode. Please try again."
  	# 	render :new
  	# end
  	# puts @events
		# @player = SoundCloud.get_artist("beck")
	end

end

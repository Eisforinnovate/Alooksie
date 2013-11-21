class UserhashtagsController < ApplicationController

	# Display hashtags for the logged in user
	def index
		logger.debug "Trying to get user_hashtags"
		if session[:user] && session[:user].id
			@hashtags = Userhashtag.find(:all, conditions:["user_id = ?",session[:user].id])
			
			render :json => {:userhashtags => @hashtags}.to_json()
		else
			render :json => {}
		end
	end

end
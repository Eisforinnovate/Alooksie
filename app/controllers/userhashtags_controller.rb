class UserhashtagsController < ApplicationController

	# Display hashtags for the logged in user
	def index
		logger.debug "Trying to get user_hashtags"
		if session[:user] && session[:user].id
			@uhashtags = Userhashtag.find(:all, conditions:["user_id = ?",session[:user].id])

			@uhashtags.each do |hashtag|
				h = Hashtag.find(hashtag.hashtag_id)
				logger.debug "Our hashtags are: #{h.name}"
				hashtag.name = h
			end

			render :json => {:userhashtags => @uhashtags}.to_json()
		else
			render :json => {}
		end
	end

end
class UserhashtagsController < ApplicationController

	# Display hashtags for the logged in user
	def index
		logger.debug "Trying to get user_hashtags"
		if session[:user] && session[:user].id
			@uhashtags = Userhashtag.find(:all, conditions:["user_id = ?",session[:user].id])

			@uhashtags.each do |hashtag|
				h = Hashtag.find(hashtag.hashtag_id)
				hashtag.name = h.name
				#Need the below code to return the proper JSON
				hashtag["name"] = h.name
			end

			render :json => {:userhashtags => @uhashtags}.to_json()
		else
			render :json => {}
		end
	end

	#Create a new hashtag link.  Create the hashtag if it doesn't exist
	def create
		if session[:user]
			@userhashtag = Userhashtag.new()
			@userhashtag.user_id = session[:user].id

			#Get the hashtag ID from the name, create if doesn't exist
			@hashtag = Hashtag.find(:first, conditions:["name = ?",params[:userhashtag][:name]])
			if (!@hashtag)
				h = Hashtag.new()
				h.name = params[:userhashtag][:name]
				h.save
				#Now get the hashtag
				@hashtag = Hashtag.find(:first, conditions:["name = ?",params[:userhashtag][:name]])
			end

			@userhashtag.hashtag_id = @hashtag.id
			@userhashtag.save

			render json: @userhashtag, status: :created

			#render json: @post, status: :created
			#redirect_to :back
		end
	end

end
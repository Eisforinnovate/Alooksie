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

	#Create a new user<->hashtag link.  Create the hashtag if it doesn't exist
	def create
		if session[:user]
			@userhashtag = Userhashtag.new()
			@userhashtag.user_id = session[:user].id

			#Strip the '#' if the user put it
			hashtag_name = params[:userhashtag][:name]
			if hashtag_name[0] == '#'
				hashtag_name[0] = ''
			end

			#Get the hashtag ID from the name, create if doesn't exist
			@hashtag = Hashtag.find(:first, conditions:["name = ?",hashtag_name])
			if (!@hashtag)
				h = Hashtag.new()
				h.name = params[:userhashtag][:name]
				h.save
				#Now get the hashtag
				@hashtag = Hashtag.find(:first, conditions:["name = ?",hashtag_name])
			end

			@userhashtag.hashtag_id = @hashtag.id
			@userhashtag.save

			#Set the name of the new element
			@userhashtag.name = params[:userhashtag][:name]
			@userhashtag["name"] = params[:userhashtag][:name]

			render json: @userhashtag, status: :created

			#render json: @post, status: :created
			#redirect_to :back
		end
	end

	#Destroy the user<->hashtag link.
	def destroy
		if session[:user]
			logger.debug "Poop: #{params[:id]}"
			@userhashtag = Userhashtag.find(params[:id])
			#Verify that the user isn't sneaky and tried to delete someone else's hashtag
			if @userhashtag.user_id == session[:user].id
				@userhashtag.destroy
				render json: @userhashtag
			end
		else
			render json: {}
		end

	end

end
#encoding: utf-8

class MessagesController < ApplicationController

	# Display all messages in the system
	def index
		# Note that message should be pluralized for groups of messages or singular for one-ofs

		@messages = Message.all

		@messages.each do |message|
			#Get the user who wrote the message
			u = User.find(message.user_id)
			##TODO: Move this to the client-side
			message.name = u.name
			#Need the below code to return the proper JSON
			message["name"] = u.name

			#Calculate the Puzzle Priority
			p = puzzleSize(message.id)
			message.priority = p
			message["priority"] = p
		end

		render :json => {:messages => @messages}.to_json()
	end

	def test
		#@messages = Message.all
		logger.info "Logger through test: #{session[:user]}"
	end

	# Display the post new screen
	def new
		render "post"
	end

	# Actually create a new message and then send the user back over to their new post
	def create
		if session[:user]
			@post = Message.new(:content => params[:message][:content])
			logger.debug "Params: #{params[:message][:content]}"
			@post.user_id = session[:user].id
			@post.other_list = params[:message][:tags]

			@post.save
			render json: @post, status: :created
			#redirect_to :back
		end
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy

	    redirect_to :back
	end

	# Show a single message
	def show
		@message = Message.find(params[:id])
		render :json => {:message => @message}.to_json()
	end



	##TODO: Move to client side
	private
	#Returns an integer of 1-5
	#selected_hashtags is an ARRAY of hashtag_id's, from what the user has selected for their search criteria.
	#this could be done on the front-end through javascript if the calculation takes too long
	def puzzleSize(id)

		if !session[:user]
			#return 0
			return 'importance-verylow'
		end

		#It is silly to call these for each message but I'm too lazy and will fix this later #YOLO
		selected_hashtags = Userhashtag.find(:all, conditions:["user_id=?",session[:user].id])

		#Return the middle size if the user has not selected any tags
		if selected_hashtags.nil? || selected_hashtags.empty?
			#return 3
			return 'importance-medium'
		end

		#Get the hashtags from the message
		#msghashtags = Messagehashtag.find(select: "hashtag_id", conditions:["message_id = ?",id])
		hashtag_ids = Messagehashtag.where(["message_id", id]).select("hashtag_id")


		#Return the 2nd smallest size if the message has no hashtags
		if hashtag_ids.empty?
			#return 2
			return 'importance-low'
		end

		#If hashtag_ids only contains one element, is it still an array on just an integer?
		#Could pose problems....
		
		#o(n^2) implentation, only ~5 tags per message so it shouldn't be a problem
		hashtag_match = 0
		selected_hashtags.each do |user_hashtag|
			hashtag_ids.each do |message_hashtag|
				if user_hashtag == message_hashtag
					hashtag_match += 1
				end
			end
		end

		#Return size based on matches
		if hashtag_match == 0
			#return 1
			return 'importance-verylow'
		elsif hashtag_match == 1
			#return 3
			return 'importance-medium'
		elsif hashtag_match == 2
			#return 4
			return 'importance-high'
		else
			#return 5
			return 'importance-veryhigh'
		end

	end

end
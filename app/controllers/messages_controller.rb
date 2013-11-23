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
			@post.user_id = session[:user].id
			@post.save

			#Remove the hashtags
			words = params[:message][:content].split
			words.each do |word|
				if word[0] == "#"
					#Determine if the hashtag exists
					word[0] = ''
					@hashtag = Hashtag.find(:first, conditions:["name = ?",word])

					#Create the hashtag
					if !@hashtag
						@hashtag = Hashtag.new(name: word)
						@hashtag.save
					end

					#Create the hashtag<->message link
					@messagehashtag = Messagehashtag.new(message_id: @post.id, hashtag_id: @hashtag.id)
					@messagehashtag.save
				end
			end


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
			return 0
		end

		#It is silly to call these for each message but I'm too lazy and will fix this later #YOLO
		selected_hashtags = Userhashtag.find(:all, conditions:["user_id=?",session[:user].id])

		#Return the middle size if the user has not selected any tags
		if selected_hashtags.nil? || selected_hashtags.empty?
			return 3
		end

		#Get the hashtags from the message
		#msghashtags = Messagehashtag.find(select: "hashtag_id", conditions:["message_id = ?",id])
		hashtag_ids = Messagehashtag.find(:all, conditions:["message_id = ?", id])

		#Return the 2nd smallest size if the message has no hashtags
		if hashtag_ids.empty?
			return 2
		end

		#If hashtag_ids only contains one element, is it still an array on just an integer?
		#Could pose problems....
		
		#o(n^2) implentation, only ~5 tags per message so it shouldn't be a problem
		hashtag_match = 0
		logger.debug "for message: #{id}"
		selected_hashtags.each do |user_hashtag|
			hashtag_ids.each do |message_hashtag|
				logger.debug "eric is lame #{user_hashtag.hashtag_id},#{message_hashtag.hashtag_id}"
				if user_hashtag.hashtag_id == message_hashtag.hashtag_id
					hashtag_match += 1
				end
			end
		end

		#Return size based on matches
		if hashtag_match == 0
			return 1
		elsif hashtag_match == 1
			return 3
		elsif hashtag_match == 2
			return 4
		else
			return 5
		end

	end

end
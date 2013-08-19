#encoding: utf-8

class MessagesController < ApplicationController
	# Display all messages in the system
	def index
		@messages = Message.all
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
			@post.other_list = params[:message][:tags]

			@post.save
			redirect_to :back
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
		render "view"
	end
end
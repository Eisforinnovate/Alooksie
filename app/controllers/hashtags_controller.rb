class HashtagsController < ApplicationController

	# Display hashtags
	def index
		render :json => {hashtags: Hashtag.all}.to_json()
	end

	# Show a single hashtag
	def show
		@hashtag = Hashtag.find(params[:id])
		render :json => {:hashtag => @hashtag}.to_json()
	end

end
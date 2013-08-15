class TagsController < ApplicationController
  # For now list all tags in the system; later should sort by most relevant to the current user
  def index
  	#@tags = ActsAsTaggableOn::Tag.includes(:tagging).where("taggings.context = 'other'").select("DISTINCS tags.*")
  	@tags = Message.tag_counts_on(:others)
  	render json: @tags.collect {|o| {:value => o.name, :name => o.name} }
  end
  
  # When sent a new tag, either create a new tag or ignore it if it already exists
  def create
  	
  end
end

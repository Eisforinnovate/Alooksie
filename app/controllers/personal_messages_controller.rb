class PersonalMessagesController < ApplicationController


  def new
  #	@sender_id = @user.id

  	#temporary until I can get sessions (internet access)
  	@personal_message = PersonalMessage.new
  	@sender_id = User.find(1).id

  	@receiver_id = params[:recipient]
  	@content = params[:content]
  end

  def create
  	@personal_message = PersonalMessage.new(params[:personal_message])
  	@personal_message.sender_id = User.find(1).id  #this will change to current user
  	@personal_message.save()

  end

  def show
  	@my_messages = PersonalMessage.find(:all, conditions:["receiver_id = ?",
          User.find(1).id])  #this will change to current user

  end



end

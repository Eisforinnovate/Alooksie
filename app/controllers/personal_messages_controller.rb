class PersonalMessagesController < ApplicationController


  def new
  	@personal_message = PersonalMessage.new

  	#Get Parameters
  	@receiver_id = params[:recipient]
  	@content = params[:content]
  	@anonymous = params[:anonymous]
  end

  def create
  	@personal_message = PersonalMessage.new(params[:personal_message])
  	#temp
  	@user = User.where("name = ?", session[:user].name).find(1)
  	@personal_message.sender_id = @user.id
  	@personal_message.save()

  end

  #Inbox Screen
  def show
  	#The session doesn't contain ID so we need to find it
  	@user = User.where("name = ?", session[:user].name).find(1)
  	@my_messages = PersonalMessage.where("receiver_id = ?", @user.id)


  end



end

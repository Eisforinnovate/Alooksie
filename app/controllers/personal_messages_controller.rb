class PersonalMessagesController < ApplicationController


  def new
  	@personal_message = PersonalMessage.new

  	#Get Parameters
  	@receiver_id = params[:recipient]
  	@content = params[:content]
  	@anonymous = params[:anonymous]
    @reply = params[:reply]
  end

  def create
  	@personal_message = PersonalMessage.new(params[:personal_message])
  	@personal_message.sender_id = session[:user].id
    @personal_message.read = false;
  	@personal_message.save()

  end

  #Inbox Screen
  def show
  #The session doesn't contain ID so we need to find it
  @my_messages = PersonalMessage.where("receiver_id = ?", session[:user].id)


  end

  #Sent Messages Screen
  def sent
    @sent_messages = PersonalMessage.where("sender_id = ?", session[:user].id)
  end



end

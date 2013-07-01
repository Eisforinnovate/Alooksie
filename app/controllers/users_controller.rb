class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  	@messages_from = @user.messages
  end
end

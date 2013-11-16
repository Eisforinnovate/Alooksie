class UsersController < ApplicationController
  def new
  end

  def index
  	render json: User.all
  end

  def show
  	@user = User.find(params[:id])
  	@messages = @user.messages
  end
end

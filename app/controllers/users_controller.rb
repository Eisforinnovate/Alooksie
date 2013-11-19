class UsersController < ApplicationController
  def new
  end

  def index
  	render :json => {:users => User.all}.to_json()
  end

  def show
  	@user = User.find(params[:id])
  	render :json => {:user => @user}.to_json()
  end
end

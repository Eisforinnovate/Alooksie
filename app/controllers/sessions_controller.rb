# encoding: UTF-8
class SessionsController < ApplicationController
	def create
		auth_hash = request.env['omniauth.auth']
		#Check if there's an existing authorization
		@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		if @authorization
			user = User.find_by_id(@authorization.user_id)
			render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
			render user.to_json
		else
			user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
			user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			user.save
			render :text => "Hi #{user.name}! You've signed up."
		end
	end

	def destroy
		session[:user_id] = nil
	    flash[:notice] = "You have successfully logged out"
	    redirect_to root_url
	end

	def failure
		flash[:notice] = "You've denied login access to our app!"
	    redirect_to root_url
	end
end

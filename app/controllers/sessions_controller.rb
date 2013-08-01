# encoding: UTF-8
class SessionsController < ApplicationController
	# Delete inactive sessions; default to one hour session expiry
	def self.sweep(time = 1.hour)
	    if time.is_a?(String)
	      time = time.split.inject { |count, unit| count.to_i.send(unit) }
	    end

	    delete_all "updated_at < '#{time.ago.to_s(:db)}' OR created_at < '#{2.days.ago.to_s(:db)}'"
	end

	def create
		auth_hash = request.env['omniauth.auth']
		# Check if there's an existing authorization
		@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		if @authorization
			user = User.find_by_id(@authorization.user_id)
			#render :text => "Welcome back #{@authorization.user.name}! You have already signed up. <ul><li>ID: #{user.id}</li><li>Email: #{user.email}</li><li>Created: #{user.created_at}</li><li>#{auth_hash.to_json}</li></ul>"
		else
			user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
			user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			user.save
			#render :text => "Hi #{user.name}! You've signed up. <ul><li>ID: #{user.id}</li><li>Email: #{user.email}</li><li>Created: #{user.created_at}</li></ul>"
		end

		# Create a new user session
		session[:user_id] = user.id
		session[:user] = user

		# Redirect to the user page
		redirect_to :back
	end

	def destroy
		session[:user_id] = nil
		session[:user] = nil
		flash[:notice] = "You have successfully logged out"
		redirect_to root_url
	end

	def failure
		flash[:notice] = "You've denied login access to our app!"
	    redirect_to root_url
	end
end

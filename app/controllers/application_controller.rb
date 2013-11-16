class ApplicationController < ActionController::Base
	protect_from_forgery

	def current_user
		@user ||= session[:user]
	end

	def index
	end

end

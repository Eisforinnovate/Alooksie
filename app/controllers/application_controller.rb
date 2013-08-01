class ApplicationController < ActionController::Base
	protect_from_forgery

	def current_user
		#temporarily cheating hehe
		#@user ||= session[:user]
		@user = User.find(1)
	end

end

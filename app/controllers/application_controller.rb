class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :pm_notifications

	def current_user
		@user ||= session[:user]
	end

	def pm_notifications
		if session[:user]
			@pm_notifications = PersonalMessage.where("receiver_id = ? AND read = ?", session[:user].id, false).count
		else
			return nil
		end
	end

end

module PersonalMessagesHelper

	def getSenderName(id)
		@sender_name = User.find(id).name
	end

end

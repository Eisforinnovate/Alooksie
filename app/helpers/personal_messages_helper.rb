module PersonalMessagesHelper

	def getSenderName(id)
		@sender_name = User.find(id).name
	end

	#this is a temporary solution because the params ids is not working for some reason
	def getUserId(name)
		@id = User.find(:all, conditions:["name = ?",name])
	end

	def setRead(id)
		@message = PersonalMessage.find(id)
		@message.read = true
		@message.save
	end

	#Determines if the recipient name should be hidden from the sent screen
	def hideName?(reply)
		@original_message = PersonalMessage.find(reply)
		if (@original_message.receiver_id == session[:user].id) &&
			(@original_message.anonymous)
			return true
		else
			return false
		end
	end

end

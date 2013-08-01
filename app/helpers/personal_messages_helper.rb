module PersonalMessagesHelper

	def getSenderName(id)
		@sender_name = User.find(id).name
	end

	#this is a temporary solution because the params ids is not working for some reason
	def getUserId(name)
		@id = User.find(:all, conditions:["name = ?",name])
	end

end

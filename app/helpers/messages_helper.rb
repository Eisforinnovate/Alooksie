module MessagesHelper
	
	#Returns an integer of 1-5
	#selected_hashtags is an ARRAY of hashtag_id's, from what the user has selected for their search criteria.
	def puzzleSize(id, selected_hashtags)

		#Return the middle size if the user has not selected any tags
		if selected_hashtags.nil? || selected_hashtags.empty?
			return 3
		end

		#Get the hashtags from the message
		hashtag_ids = Messagehashtag.find(:all, conditions:["message_id = ?",id]).hashtag_id

		#Return the 2nd smallest size if the message has no hashtags
		if hashtag_ids.nil?
			return 2
		end

		#If hashtag_ids only contains one element, is it still an array on just an integer?
		#Could pose problems....
		
		#o(n^2) implentation, only ~5 tags per message so it shouldn't be a problem
		hashtag_match = 0
		selected_hashtags.each do |user_hashtag|
			hashtag_ids.each do |message_hashtag|
				if user_hashtag == message_hashtag
					hashtag_match += 1
				end
			end
		end

		#Return size based on matches
		if hashtag_match == 0
			return 1
		elsif hashtag_match == 1
			return 3
		elsif hashtag_match == 2
			return 4
		else
			return 5
		end

	end

end
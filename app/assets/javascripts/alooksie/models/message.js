App.Message = DS.Model.extend({
	content: DS.attr('string'),
	user_id: DS.attr('number'),
	created_at: DS.attr('string'),
	updated_at: DS.attr('string'),
	user: DS.belongsTo('user', {async: true}),
	messagehashtag: DS.hasMany('messagehashtag'),
	priority: DS.attr('number'),
	/**
	 * Should return the curent message priority here
	 * @return {[type]} [description]
	 */
	//priorityClass: function(selected_hashtags) { 
	priorityClass: function(user_id){
	/*	//Return the middle size if the user has not selected any tags
		if(selected_hashtags.length < 1)
			return 3;

		//Get the hashtags from the message
		var hashtags = this.get('store').find('messagehashtag', params.hashtag_id);

		//Return 2nd smallest size if the message has no hashtags
		if(hashtags.length < 1)
			return 2;

		//Determine the number of matching tags
		var hashtag_match = 0;
		for(int i = 0; i < selected_hashtags.length; i++){
			for (int j = 0; j < hashtags.length; j++){
				if(hashtag[j].id == selected_hashtags[i])
					hashtag_match++;
			}
		}
		if(hashtag_match == 0)
			return 1;
		else if (hashtag_match == 1)
			return 3;
		else if (hashtag_match == 2)
			return 4;
		else
			return 5;*/
		return 'importance-medium';
	}.property('priority')
});

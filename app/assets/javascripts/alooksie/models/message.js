App.Message = DS.Model.extend({
	content: DS.attr('string'),
	user_id: DS.attr('number'),
	name: DS.attr('string'),
	priority: DS.attr('number'),
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
		if(this.priority == 1 || this.priority == 2)
			return '';
		else
			return 'importance-medium';
	}.property('priority')
});

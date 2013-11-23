App.Message = DS.Model.extend({
	content: DS.attr('string'),
	user_id: DS.attr('number'),
	name: DS.attr('string'),
	priority: DS.attr('string'),
	created_at: DS.attr('string'),
	updated_at: DS.attr('string'),
	user: DS.belongsTo('user', {async: true}),
	messagehashtag: DS.hasMany('messagehashtag'),
	priority: DS.attr('number'),
	priorityClass: 'importance-3',
	/**
	 * Should return the curent message priority here
	 * @return {[type]} [description]
	 */
	priorityClass: function(user_id){
		if(this.priority == 1 || this.priority == 2)
			return '';
		else
			return 5;
		return 'importance-'+Math.floor((Math.random()*5)+1);
	}.property('priority')
});

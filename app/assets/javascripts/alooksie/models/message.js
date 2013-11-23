App.Message = DS.Model.extend({
	content: DS.attr('string'),
	user_id: DS.attr('number'),
	name: DS.attr('string'),
	priority: DS.attr('number'),
	created_at: DS.attr('string'),
	updated_at: DS.attr('string'),
	user: DS.belongsTo('user', {async: true}),
	messagehashtag: DS.hasMany('messagehashtag'),
	priorityClass: function() {
		return 'importance-'+priority;
	}.property('priority')
});

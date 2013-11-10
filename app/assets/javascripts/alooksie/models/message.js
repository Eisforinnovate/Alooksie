App.Message = DS.Model.extend({
	content: DS.attr('string'),
	userId: DS.attr('number'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	user: DS.belongsTo('user'),
	messagehashtag: DS.hasMany('messagehashtag'),
	/**
	 * Should return the curent message priority here
	 * @return {[type]} [description]
	 */
	priority: function() {
		return 2;
	}.property('messagehashtag','createdAt')
});

App.Message.FIXTURES = [
	{id: 1, content: 'HI!', userId: 0, createdAt: new Date(), updatedAt: new Date(), tags: ['stupid', 'tag', 'here']},
	{id: 2, content: 'WHAT!', userId: 2, createdAt: new Date(), updatedAt: new Date()},
	{id: 3, content: 'COOL!', userId: 1, createdAt: new Date(), updatedAt: new Date()}
]
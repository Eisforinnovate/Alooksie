App.Message = DS.Model.extend({
	content: DS.attr('string'),
	user_id: DS.attr('number'),
	created_at: DS.attr('string'),
	updated_at: DS.attr('string'),
	user: DS.belongsTo('user'),
	messagehashtag: DS.hasMany('messagehashtag'),
	priority: DS.attr('number'),
	/**
	 * Should return the curent message priority here
	 * @return {[type]} [description]
	 */
	classes: function() {
		console.log(this);
	}.property('priority')
});

App.Message.FIXTURES = [
	{id: 1, content: 'HI!', userId: 1, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), tags: ['stupid', 'tag', 'here']},
	{id: 2, content: 'WHAT!', userId: 2, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 1},
	{id: 3, content: 'COOL!', userId: 1, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 1},
	{id: 4, content: 'HI!', userId: 1, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 2, tags: ['stupid', 'tag', 'here']},
	{id: 5, content: 'HI!', userId: 2, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 3, tags: ['stupid', 'tag', 'here']},
	{id: 6, content: 'HI!', userId: 2, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 4, tags: ['stupid', 'tag', 'here']},
	{id: 7, content: 'WHAT!', userId: 2, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 1},
	{id: 8, content: 'COOL!', userId: 1, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 1},
	{id: 9, content: 'HI!', userId: 1, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 2, tags: ['stupid', 'tag', 'here']},
	{id: 10, content: 'HI!', userId: 1, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 3, tags: ['stupid', 'tag', 'here']},
	{id: 11, content: 'HI!', userId: 1, createdAt: moment(new Date()).fromNow(), updatedAt: moment(new Date()).fromNow(), priority: 4, tags: ['stupid', 'tag', 'here']}
]
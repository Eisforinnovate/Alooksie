App.Hashtag = DS.Model.extend({
	name: DS.attr('string'),
	criteria: DS.attr('string'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	messagehashtag: DS.hasMany('messagehashtag')
});

/**
 * Test fixtures
 * @type {Object}
 */
App.Hashtag.FIXTURES = [
	{id: 1, name: 'test'},
	{id: 2, name: 'blah'},
	{id: 3, name: 'stupid'},
	{id: 4, name: 'MarkIsGreat'}
]
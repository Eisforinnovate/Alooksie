App.User = DS.Model.extend({
	name: DS.attr('string'),
	email: DS.attr('string'),
	universityId: DS.attr('number'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	messages: DS.hasMany('message')
});

App.User.FIXTURES = [
	{id: 1, name: 'Mark', email: 'mark@mark.com', createdAt: new Date(), updatedAt: new Date()},
	{id: 2, name: 'Ben', email: 'ben@mark.com', createdAt: new Date(), updatedAt: new Date()},
	{id: 3, name: 'Dorkface', email: 'eric@mark.com', createdAt: new Date(), updatedAt: new Date()}
]
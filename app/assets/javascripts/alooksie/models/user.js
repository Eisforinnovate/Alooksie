App.User = DS.Model.extend({
	name: DS.attr('string'),
	email: DS.attr('string'),
	universityId: DS.attr('number'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	messages: DS.hasMany('message')
});
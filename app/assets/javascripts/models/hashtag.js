Alooksie.Hashtag = DS.Model.extend({
	name: DS.attr('string'),
	criteria: DS.attr('string'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	messagehashtag: DS.hasMany('messagehashtag')
});
Alooksie.User = DS.Model.extend({
	content: DS.attr('string'),
	userId: DS.attr('number'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	user: DS.belongsTo('user'),
	messagehashtag: DS.hasMany('messagehashtag')
});
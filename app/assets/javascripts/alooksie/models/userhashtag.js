App.Userhashtag = DS.Model.extend({
	userId: DS.attr('number'),
	hashtagId: DS.attr('number'),
	name: DS.attr('string'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	user: DS.belongsTo('user'),
	hashtag: DS.belongsTo('hashtag'),
});
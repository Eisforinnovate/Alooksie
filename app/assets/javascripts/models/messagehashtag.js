Alooksie.Hashtag = DS.Model.extend({
	messageId: DS.attr('number'),
	hashtagId: DS.attr('number'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	message: DS.belongsTo('message'),
	hashtag: DS.belongsTo('hashtag')
});
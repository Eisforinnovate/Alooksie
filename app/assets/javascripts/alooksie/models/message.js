App.Message = DS.Model.extend({
	content: DS.attr('string'),
	user: DS.belongsTo('user'),
	hashtags: DS.hasMany('hashtag')
});
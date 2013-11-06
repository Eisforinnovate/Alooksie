App.Hashtag = DS.Model.extend({
	name: DS.attr('string'),
	messages: DS.hasMany('message')
});
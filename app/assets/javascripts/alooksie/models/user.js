App.User = DS.Model.extend({
	name: DS.attr('string'),
	email: DS.attr('string'),
	university_id: DS.attr('number'),
	created_at: DS.attr('date'),
	updated_at: DS.attr('date'),
	messages: DS.hasMany('message')
});

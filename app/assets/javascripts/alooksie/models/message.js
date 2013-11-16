App.Message = DS.Model.extend({
	content: DS.attr('string'),
	userId: DS.attr('number'),
	createdAt: DS.attr('date'),
	updatedAt: DS.attr('date'),
	user: DS.belongsTo('user'),
	messagehashtag: DS.hasMany('messagehashtag'),
	/**
	 * Should return the curent message priority here
	 * @return {[type]} [description]
	 */
	priority: function() {
		return 2;
	}.property('messagehashtag','createdAt')
});
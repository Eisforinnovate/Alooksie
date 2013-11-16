App.UsersRoute = Ember.Route.extend({
	model: function() {
		this.store.findAll('user');
	}
});
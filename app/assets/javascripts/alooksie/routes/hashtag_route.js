App.HashtagsRoute = Ember.Route.extend({

	model: function() {
		return this.store.findAll('hashtag');

	},
	setupController: function(controller, model) {
		controller.set('model', model);
	}
});

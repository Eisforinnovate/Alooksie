App.IndexRoute = Ember.Route.extend({
  	/**
	 * Return a 
	 * @param {object} params [unused here]
	 * @return {array} 		  Should return an array of Message models
	 */
	model: function() {
		return this.store.findAll('message');

	},
	renderTemplate: function() {
		this.render('alooksie/templates/feed');
		// this.render('alooksie/templates/messages/index', {
		// 	controller: 'MessagesController'
		// });
		this.render('alooksie/templates/userhashtags/filter', {
			// into: 'UserhashtagsRoute',
			// controller: 'UserhashtagsController',
			outlet: 'sidebar'
		})
	},
	redirect: function() {
		this.transitionTo('messages');
	}
});

App.FBIndexRoute = Ember.Route.extend({
	redirect: function() {
		this.transitionTo('index');
	}
});
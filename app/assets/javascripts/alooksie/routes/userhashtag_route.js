// Core messages route
App.UserhashtagsRoute = Ember.Route.extend({
	/**
	 * Return a 
	 * @param {object} params [unused here]
	 * @return {array} 		  Should return an array of Message models
	 */
	model: function() {
		return this.store.findAll('userhashtag');
	},
	setupController: function(controller, hashtags) {
		controller.set('model', hashtags);
	},
	// Render the main template
	renderTemplate: function() {
		this.render('alooksie/templates/userhashtags/index');
	}
});


App.UserhashtagsNewRoute = Ember.Route.extend({
	model: function(){
		return this.store.createRecord('userhashtag');
	},
	setupController: function(controller, model){
		controller.set('model', model);
	},
	renderTemplate: function() {
		this.render('alooksie/templates/userhashtags/new');
	}
});
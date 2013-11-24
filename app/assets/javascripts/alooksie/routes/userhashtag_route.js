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
	},
	actions: {
		save: function(){
			return this.controller.get('model').save().then(function(){
				this.transitionTo('userhashtags');
			}.bind(this));
		},
		cancel: function(){
			this.controller.get('model').deleteRecord();
			this.transitionTo('userhashtags');
		}
	}
});

App.UserhashtagRoute = Ember.Route.extend({
	model: function(params){
		return this.store.find('userhashtag', params.userhashtag_id);
	},
	setupController: function(controller, userhashtag){
		controller.set('model', userhashtag);
	},
	renderTemplate: function(){
		this.render('alooksie/templates/userhashtags/show');
	}
})
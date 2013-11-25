// Core messages route
App.MessagesRoute = Ember.Route.extend({
	/**
	 * Return a 
	 * @param {object} params [unused here]
	 * @return {array} 		  Should return an array of Message models
	 */
	model: function() {
		return this.store.findAll('message');

	},
	setupController: function(controller, feed) {
		controller.set('model', feed);
	},
	// Render the main template
	renderTemplate: function() {
		this.render('alooksie/templates/messages/main');
	}
});

App.MessageRoute = Ember.Route.extend({
	/**
	 * Returns a message model
	 * @param  {object} params An object; should contain message_id to identify the specific Message to load
	 * @return {Message}       An instance of a Message model
	 */
	model: function(params) {
		return this.store.find('message', params.message_id);
	},
	setupController: function(controller, message) {
		controller.set('model', message);
	},
	renderTemplate: function(){
		this.render('alooksie/templates/messages/show');
	}
});

App.MessagesIndexRoute = Ember.Route.extend({
	/**
	 * Return a 
	 * @param {object} params [unused here]
	 * @return {array} 		  Should return an array of Message models
	 */
	model: function() {
		return this.store.findAll('message');

	},
	renderTemplate: function() {
		this.render('alooksie/templates/messages/index');
	}
});


App.MessagesNewRoute = Ember.Route.extend({
	model: function(){
		return this.store.createRecord('message');
	},
	setupController: function(controller, model){
		controller.set('model', model);
	},
	renderTemplate: function() {
		this.render('alooksie/templates/messages/new');
	},
	actions: {
		save: function(){
			return this.controller.get('model').save().then(function(){
				this.transitionTo('messages');
			}.bind(this));
		},
		cancel: function(){
			//this.controller.get('model').deleteRecord();
			this.transitionTo('messages');
		},
		willTransition: function(transition) {
			if(this.controller.get('model').get('id') == null) {
				if(confirm('You will lose any changes made to your new message; continue?')) {
					this.controller.get('model').deleteRecord();
					return true;
				} else {
					transition.abort();
					return false;
				}
			} else {
				// Bubble up
				return true;
			}
		}
	}
});
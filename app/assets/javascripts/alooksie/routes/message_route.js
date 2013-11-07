App.MessageRoute = Ember.Route.extend({
	/**
	 * Returns a message model
	 * @param  {object} params An object; should contain message_id to identify the specific Message to load
	 * @return {Message}       An instance of a Message model
	 */
	model: function(params) {
		// BENLOOKHERE Return a specific message model here
	},
	setupController: function(controller, message) {
		controller.set('model', message);
	}
});

App.MessagesRoute = Ember.Route.extend({
	/**
	 * Return a 
	 * @param {object} params [unused here]
	 * @return {array} 		  Should return an array of Message models
	 */
	model: function(params) {
		// BENLOOKHERE Return an array of message models here
		return [{content: "hi"}];
	},
	setupController: function(controller, feed) {
		controller.set('model', feed);
	},
	renderTemplate: function() {
		this.render('alooksie/templates/messages/list');
	}
})
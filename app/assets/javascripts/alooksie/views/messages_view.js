App.MessageView = Ember.View.extend({
	templateName: "alooksie/templates/messages/show"
});

App.MessagesView = Ember.View.extend({
	templateName: "alooksie/templates/messages/index",
	didInsertElement: function() {
		console.log('hi');
	}
});
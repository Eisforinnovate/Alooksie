App.MessageController = App.ObjectController.extend({
	model: 'message'
});

App.MessagesController = Ember.ArrayController.extend({
	needs: ['currentUser'],
	itemController: "message"
});

App.MessagesIndexController = Ember.ArrayController.extend({
	// needs: ['currentUser'],
	// itemController: 'message'
});

App.MessagesNewController = App.ObjectController.extend({
});
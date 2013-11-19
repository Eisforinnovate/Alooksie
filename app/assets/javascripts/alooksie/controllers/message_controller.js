App.MessageController = App.ObjectController.extend({
	model: 'message'
});

App.MessagesController = Ember.ArrayController.extend({
	needs: ['currentUser']
});
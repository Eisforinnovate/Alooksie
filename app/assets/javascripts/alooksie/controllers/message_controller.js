App.MessageController = App.ObjectController.extend({
	model: 'message'
});

App.MessagesController = Ember.ArrayController.extend({
	needs: ['currentUser']
});

App.MessagesNewController = Ember.ObjectController.extend({
	actions: {
		save: function(){
		return this.get('model').save().then(function(){
			this.transitionToRoute('messages.main');
		});
		}		
	}

});
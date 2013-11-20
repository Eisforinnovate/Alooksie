App.MessageController = App.ObjectController.extend({
	model: 'message'
});

App.MessagesController = Ember.ArrayController.extend({
	needs: ['currentUser']
});

App.MessagesNewController = Ember.ObjectController.extend({
	actions: {
		save: function(){
			var self = this;
			// return this.content.save().then(function(){
			// 	return _this.transitionToRoute('messages.index');
			// });
		}		
	}

});
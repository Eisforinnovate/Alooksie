App.MessageController = App.ObjectController.extend({
	model: 'message'
});

App.MessagesController = Ember.ArrayController.extend({
	needs: ['currentUser']
});

App.MessagesNewController = Ember.ObjectController.extend({
	save: function(){
		var _this = this;
		return this.content.save().then(function(){
			return _this.transitionToRoute('messages.index');
		});
	}
});
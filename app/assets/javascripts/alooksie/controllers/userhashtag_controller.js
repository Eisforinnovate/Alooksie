App.UserhashtagsController = Ember.ArrayController.extend({
	needs: ['currentUser']
});

App.UserhashtagsNewController = Ember.ObjectController.extend({
	actions: {
		save: function(){
		//Creating a new hashtag if it doesn't already exist is handled on the server side
		return this.get('model').save().then(function(){
			this.transitionToRoute('messages.main');
		});
		}		
	}

});
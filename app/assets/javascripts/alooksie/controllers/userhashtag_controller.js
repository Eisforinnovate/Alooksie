App.UserhashtagController = Ember.ObjectController.extend({
	actions: {
		destroy: function(){
			var hashtag = this.get('model');
			hashtag.deleteRecord();
			return hashtag.save();
		}
	}
});

App.UserhashtagsController = Ember.ArrayController.extend({
	needs: ['currentUser'],
	itemController: 'Userhashtag'
});

App.UserhashtagsNewController = Ember.ObjectController.extend({
});

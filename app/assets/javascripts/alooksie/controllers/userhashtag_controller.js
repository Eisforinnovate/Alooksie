App.UserhashtagsController = Ember.ArrayController.extend({
	needs: ['currentUser']
});

App.UserhashtagsNewController = Ember.ObjectController.extend({


});

App.UserhashtagController = Ember.ObjectController.extend({
	actions: {
			destroy: function(){
			var hashtag = this.get('model');
			hashtag.deleteRecord();
			return hashtag.save();
		}
	}
});
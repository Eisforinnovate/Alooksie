App.UserhashtagView = Ember.View.extend({
	templateName: "alooksie/templates/userhashtags/show",
	classNames: ['btn-group','hashtag']
});
App.UserHashtagsView = Ember.View.extend({
	templateName: 'alooksie/templates/userhashtags/list'
})

App.NewUserHashtagView = Ember.View.extend({
	templateName: 'alooksie/templates/userhashtags/new',
	actions: {
		save: function() {
			// Creating a new hashtag if it doesn't already exist is handled on the server side
			return this.get('model').save().then(function(){
				//this.transitionToRoute('messages.main');
			});
		}
	}
})

App.HashtagFilterView = Ember.View.extend({
	templateName: 'alooksie/templates/userhashtags/filter',
	classNames: ['panel','filters']
});
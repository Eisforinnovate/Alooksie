App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('messages');
  }
});

App.FBIndexRoute = Ember.Route.extend({
	redirect: function() {
		this.transitionTo('messages');
	}
});
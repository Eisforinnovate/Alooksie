App.CurrentUserController = Ember.ObjectController.extend({
  isSignedIn: (function() {
    return this.get('isSignedIn');
  }).property('@isSignedIn'),
  id: (function() {
  	return this.get('id');
  }).property('@id')
});
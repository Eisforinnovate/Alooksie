Ember.Application.initializer({
  name: 'currentUser',
  initialize: function(container) {
    var attributes, controller, object, store, user;
    store = container.lookup('store:main');
    attributes = $('meta[name="current-user"]').attr('content');
    if (attributes) {
      //object = store.find(App.User, JSON.parse(attributes));

 	  var id = parseInt(attributes);
      user = store.find('user', id);
      controller = container.lookup('controller:currentUser').set('content', user);
      return container.typeInjection('controller', 'currentUser', 'controller:currentUser');
    }
  }
});
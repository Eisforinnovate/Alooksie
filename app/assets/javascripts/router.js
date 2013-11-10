/**
 * Router methods go here
 */
App.Router.map(function () {
	this.resource('messages', function() {
		this.route('new');
	    this.resource('message', {path: ':message_id'});
	});
	this.resource('users', function() {
		this.route('new');
		this.resource('user', {path: ':message_id'});
	})
});

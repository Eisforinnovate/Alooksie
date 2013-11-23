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
		this.resource('user', {path: ':user_id'});
	});
	this.resource('userhashtags', function(){
		this.route('new');
		this.resource('userhashtag', {path: ':userhashtag_id'});
	});
});

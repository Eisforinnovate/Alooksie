App.MessageView = Ember.View.extend({
	templateName: "alooksie/templates/messages/show",
	tagName: 'div',
	classNames: ['message', 'panel'],
	classNameBindings: ['priority']
});

App.MessagesView = Ember.View.extend({
	templateName: "alooksie/templates/messages/list",
	tagName: 'div',
	classNames: ['messages'],
	didInsertElement: function() {
		var $element = this.$();
		$element.isotope({
			itemSelector: '.message'
		})
	}
});

App.MessagesNewView = Ember.View.extend({
	templateName: "alooksie/templates/messages/new",
	actions: {
		save: function() {
			console.log(arguments);
		}
	}
});
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
		// Add the priority class
		$element.find('.message').each(function() {
			var $this = $(this);
			$this.addClass('importance-'+$this.children('.message-content').data('priority'));
		});
		// Go-go Isotope magic!
		$element.packery({
			itemSelector: '.message'
		})
	}
});

App.MessageListView = Ember.View.extend({
	templateName: 'alooksie/templates/messages/feed',
	tagName: 'div',
	classNames: ['row']
})

App.MessagesNewView = Ember.View.extend({
	templateName: "alooksie/templates/messages/new",
	actions: {
		save: function() {
			console.log(arguments);
		}
	}
});

App.MessageFilterView = Ember.View.extend({
	templateName: 'alooksie/templates/messages/filter'
})
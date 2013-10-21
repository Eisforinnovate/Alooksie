// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require handlebars
//= require ember
//= require ember-data
//= require bootstrap-tag
//= require typeahead-bs2.min
//= require jquery.isotope
//= require lodash
//= require geo
//= require_self
//= require_tree ./controllers
//= require_tree ./models
//= require_tree ./templates
//= require_tree ./views
//= require_tree ./helpers

App = Ember.Application.create();
App.Store = DS.Store.extend({});
App.ready = function () {
}

$(document).ready(function() {
	var messages = $('.messages');
	
	messages.isotope({
		animation: 'best-available',
		masonry: {
			gutterWidth: 10
		}
	});

	$('.tag-field').tag({
		source: ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
	});
});
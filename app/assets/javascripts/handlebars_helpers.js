/**
 * An object containing all handlebars helpers being added to the application
 * @type {Object}
 */
var HandlebarsHelpers = {
	/**
	 * [dateFormat description]
	 * @param  {[type]} value   [description]
	 * @param  {[type]} options [description]
	 * @return {[type]}         [description]
	 */
	dateFormat: function(value, options) {
		options = options || {};
		$.extend(options, {
			withoutSuffix: false
		});

		var moment_obj = moment(value);
		return new Handlebars.SafeString(moment_obj.fromNow(options.withoutSuffix));
	}
}

// Okay cool let's actually get that shit into Handlebars now
Ember.Handlebars.registerBoundHelper('dateFromNow', HandlebarsHelpers.dateFormat);

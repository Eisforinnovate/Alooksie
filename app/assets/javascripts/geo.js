/**
 * The Geo object works as a wrapper for the HTML5 JS location classes, allowing for safe
 * extension and overriding of their existing functionality
 */
var Geo = function() {
	// Check for support
	if (!navigator.geolocation) {
		throw "Geolocation is not supported by this browser.";
	} else {
		this.navigator = window.navigator;
	}

	/**
	 * Gets the current location object
	 * @param  {Function} callback [description]
	 * @param  {[type]}   error    [description]
	 * @param  {[type]}   options  [description]
	 * @return {[type]}            [description]
	 */
	this.getLocation = function(callback, error, options) {
		error = error || this.error;
		options = $.extend(true, {}, this.options, options);

		if(_.isFunction(callback)) {
			this.navigator.getCurrentPosition(function(position) {
				callback(position);
			}, error, options);
		} else {
			throw new "Callback must be a function!";
		}
	};

	/**
	 * [watchPosition description]
	 * @param  {Function} callback [description]
	 * @return {[type]}            [description]
	 */
	this.watchPosition = function(callback) {
		error = error || this.error;
		options = $.extend(true, {}, this.options, options);
		
		if(_.isFunction(callback)) {
			this.navigator.getCurrentPosition(function(position) {
				callback(position);
			}, error, options);
		} else {
			throw new "Callback must be a function!";
		}
	}

	/**
	 * [error description]
	 * @param  {positionError} positionError [description]
	 * @return {[type]}               [description]
	 */
	this.error = function(positionError) {

	};

	return this;
};
// Bind all Geo functions to itself
_.bindAll(Geo);

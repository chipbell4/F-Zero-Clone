// Assuming Peach is defined globally

var Falcon = require('./Falcon.js');

FZero = (function() {
	var init = function() {	
		Peach.entities.push(new Falcon());

		Peach.init('fzero-canvas');
		Peach.start();
	};
	return {
		init: init
	};
})();

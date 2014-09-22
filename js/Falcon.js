var Sprite = require('./Sprite.js');

var sprite_sheet = '/images/falcon.gif';
var sprite_position = new Peach.Geometry.Rectangle(
	Peach.Geometry.Point.fromCartesian(0, 0),
	Peach.Geometry.Point.fromCartesian(200, 200)
);
var sprite_crop = new Peach.Geometry.Rectangle(
	Peach.Geometry.Point.fromCartesian(0, 0),
	Peach.Geometry.Point.fromCartesian(200, 200)
);

var Falcon = function() {
};

Falcon.prototype = new Sprite(sprite_sheet, sprite_position, sprite_crop);

module.exports = Falcon;

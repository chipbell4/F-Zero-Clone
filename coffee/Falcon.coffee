Sprite = require './Sprite.coffee'

sprite_sheet = '/images/falcon.gif'
sprite_position = new Peach.Geometry.Rectangle(
	Peach.Geometry.Point.fromCartesian(0, 0),
	Peach.Geometry.Point.fromCartesian(200, 200)
);
sprite_crop = new Peach.Geometry.Rectangle(
	Peach.Geometry.Point.fromCartesian(0, 0),
	Peach.Geometry.Point.fromCartesian(200, 200)
);

class Falcon extends Sprite
	constructor: ->
		super(sprite_sheet, sprite_position, sprite_crop)

module.exports = Falcon;

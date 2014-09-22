Sprite = require './Sprite.coffee'

sprite_sheet = '/images/falcon.gif'
sprite_position = new Peach.Geometry.Rectangle(
	Peach.Geometry.Point.fromCartesian(0, 0),
	Peach.Geometry.Point.fromCartesian(200, 200)
)

class Falcon extends Sprite
	constructor: ->
		# Set the sprite origin
		@sprite_origin = Peach.Geometry.Point.fromCartesian(9, 0)
		@sprite_size = Peach.Geometry.Point.fromCartesian(55, 50)
		this.moveToSpriteCoordinate(3)

		super('/images/falcon.gif', sprite_position, @sprite_crop)

	moveToSpriteCoordinate: (i) ->
		x_movement = Peach.Geometry.Point.fromCartesian(@sprite_size.x, 0).scale(i);

		crop_location = @sprite_origin.add(x_movement)
		crop_corner = crop_location.add(@sprite_size)

		@sprite_crop = new Peach.Geometry.Rectangle(
			crop_location
			crop_corner
		)

module.exports = Falcon;

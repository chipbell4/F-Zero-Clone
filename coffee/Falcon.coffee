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
		@heading = 3
		@heading_increment = 0.03

		this.moveToSpriteCoordinate(@heading)

		super('/images/falcon.gif', sprite_position, @sprite_crop)

	moveToSpriteCoordinate: (i) ->
		x_movement = Peach.Geometry.Point.fromCartesian(@sprite_size.x, 0).scale(i);

		crop_location = @sprite_origin.add(x_movement)
		crop_corner = crop_location.add(@sprite_size)

		@sprite_crop = new Peach.Geometry.Rectangle(
			crop_location
			crop_corner
		)

	doTurn: ->
		#change the heading based on key input
		if Peach.Input.state.keys['left']
			@heading -= @heading_increment
		if Peach.Input.state.keys['right']
			@heading += @heading_increment

		# always adjust back to the center
		if @heading > 3 and not Peach.Input.state.keys['right'] and not Peach.Input.state.keys['left']
			@heading -= @heading_increment
		else if @heading < 3 and not Peach.Input.state.keys['left'] and not Peach.Input.state.keys['right']
			@heading += @heading_increment

		# clamp to range
		@heading = Math.max 0, @heading
		@heading = Math.min @heading, 6

	update: ->
		this.doTurn()

		# Set position
		rounded_heading = Math.round(@heading)
		this.moveToSpriteCoordinate(rounded_heading)

module.exports = Falcon;

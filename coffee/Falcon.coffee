Sprite = require './Sprite.coffee'
CarState = require './CarState.coffee'

sprite_sheet = '/images/falcon.gif'

sprite_size = Peach.Geometry.Point.fromCartesian(55, 50)

sprite_top_left_corner = Peach.Geometry.Point.fromCartesian(400, 300)
	.add(sprite_size.scale(0.5, 0.5).negate())
sprite_position = new Peach.Geometry.Rectangle(
	sprite_top_left_corner,
	sprite_top_left_corner.add(sprite_size)
)

class Falcon extends Sprite
	constructor: ->
		# Set the sprite origin
		@sprite_origin = Peach.Geometry.Point.fromCartesian(9, 0)
		@sprite_size = Peach.Geometry.Point.fromCartesian(55, 50)
		@heading = 3
		@heading_increment = 0.07
		@car_state = new CarState(
			Peach.Geometry.Point.fromCartesian(0, 0)
			0
		)

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
		# handle turn animation
		this.doTurn()

		# update state
		@car_state.update()

		# move map
		Peach.entities[0].heading = @car_state.heading
		Peach.entities[0].position = @car_state.position

		# Set position
		rounded_heading = Math.round(@heading)
		this.moveToSpriteCoordinate(rounded_heading)

module.exports = Falcon;

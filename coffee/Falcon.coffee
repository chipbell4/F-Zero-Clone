CarState = require './CarState.coffee'

sprite_sheet = '/images/falcon.gif'

sprite_size = Peach.Geometry.Point.fromCartesian(55, 50)

sprite_top_left_corner = Peach.Geometry.Point.fromCartesian(400, 300)
	.add(sprite_size.scale(0.5, 0.5).negate())
sprite_position = new Peach.Geometry.Rectangle(
	sprite_top_left_corner,
	sprite_top_left_corner.add(sprite_size)
)

class Falcon extends Peach.Sprites.Sprite
	constructor: ->
		super(
			'/images/falcon.gif',
			Peach.Geometry.Point.fromCartesian(9, 0),
			Peach.Geometry.Point.fromCartesian(55, 50)
		)

		# draw the car a little larger
		@draw_size = Peach.Geometry.Point.fromCartesian(100, 100);
		
		# Setup the car state
		@heading = 3
		@heading_increment = 0.07
		@car_state = new CarState(
			Peach.Geometry.Point.fromCartesian(0.5, 0)
			0 #Math.PI / 2
		)

		@alive = true

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
		@doTurn()

		# update state
		@car_state.update()

		# Set position
		@current_sprite_coordinates = Peach.Geometry.Point.fromCartesian(Math.round(@heading), 0)

module.exports = Falcon;

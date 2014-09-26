CarState = require './CarState.coffee'

sprite_sheet = '/images/falcon.gif'

sprite_size = Peach.Geometry.Point.fromCartesian(55, 50)

sprite_top_left_corner = Peach.Geometry.Point.fromCartesian(400, 300)
	.add(sprite_size.scale(0.5, 0.5).negate())
sprite_draw_size = sprite_size.scale(1.5)
sprite_position = new Peach.Geometry.Rectangle(
	sprite_top_left_corner,
	sprite_top_left_corner.add(sprite_draw_size)
)

class Falcon extends Peach.Sprites.Sprite
	constructor: ->
		super(
			'/images/falcon.gif',
			Peach.Geometry.Point.fromCartesian(9, 0),
			Peach.Geometry.Point.fromCartesian(55, 50)
		)

		@draw_position = sprite_top_left_corner

		# draw the car a little larger
		@draw_size = sprite_draw_size
		
		# Setup the car state
		@car_state = new CarState(
			Peach.Geometry.Point.fromCartesian(0.5, 0)
			Math.PI / 2
		)

		@alive = true

	setTurnSprite: ->
		turn_ratio = @car_state.turner.current_turn_angle / @car_state.turner.max_turn_angle

		# scale and shift to our array coordinates
		raw_frame_position = turn_ratio * 3 + 3

		@current_sprite_coordinates = Peach.Geometry.Point.fromCartesian(
			Math.round(raw_frame_position),
			0
		)

	update: ->
		# handle turn animation
		@setTurnSprite()

		# update state
		@car_state.update()

		# set the map parameters
		Peach.entities[0].draw_position = @draw_position.add(@draw_size)
		Peach.entities[0].heading = @car_state.heading
		Peach.entities[0].world_position = @car_state.position

module.exports = Falcon;

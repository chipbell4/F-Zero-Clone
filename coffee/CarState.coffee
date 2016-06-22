Turner = require './Turner.coffee'
Accelerator = require './Accelerator.coffee'

degree = Math.PI / 180

class CarState
	constructor: (@position, @heading) ->
		max_speed = 2000
		@turner = new Turner(50 * degree, max_speed / 2, 25 * degree, max_speed, 0.0001)
		@accelerator = new Accelerator(max_speed, 50, max_speed / 4)
		@alive = true

	update: ->
		velocity_vector = Peach.Geometry.Point.fromPolar(
			@accelerator.current_speed,
			@heading + Math.PI / 2
		);

		delta_time = Peach.gameState.frameTime / 1000.0
		delta_position = velocity_vector.scale(delta_time)

		@position = @position.add(delta_position)
		@heading += @turner.current_turn_angle * delta_time * velocity_vector.magnitude()

		@accelerator.update()

		@turner.velocity = velocity_vector.magnitude()
		@turner.update()

	draw: ->

module.exports = CarState

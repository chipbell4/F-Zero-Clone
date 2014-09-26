Turner = require './Turner.coffee'
Accelerator = require './Accelerator.coffee'

degree = Math.PI / 180

class CarState
	constructor: (@position, @heading) ->
		@turner = new Turner(50 * degree, 500, 25 * degree, 1500, 0.00001)
		@accelerator = new Accelerator(1500, 50, 500)
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

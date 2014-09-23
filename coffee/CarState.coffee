Turner = require './Turner.coffee'
Accelerator = require './Accelerator.coffee'

degree = Math.PI / 180

class CarState
	constructor: (@position, @heading) ->
		@turner = new Turner(15 * degree, degree, degree)
		@accelerator = new Accelerator(10, 5, 0.01, 3)
		@alive = true

	update: ->
		velocity_vector = Peach.Geometry.Point.fromPolar(
			@accelerator.current_speed,
			@heading
		);

		delta_time = Peach.gameState.frameTime / 1000.0
		delta_position = velocity_vector.scale(delta_time)

		@position = @position.add(delta_position)
		@heading += @turner.current_turn_angle * delta_time

		@accelerator.update()
		@turner.update()

	draw: ->
		console.log @position
		console.log @heading


module.exports = CarState

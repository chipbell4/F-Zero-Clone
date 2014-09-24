Turner = require './Turner.coffee'
Accelerator = require './Accelerator.coffee'

degree = Math.PI / 180

class CarState
	constructor: (@position, @heading) ->
		@turner = new Turner(15 * degree, 12 * degree, 15 * degree)
		@accelerator = new Accelerator(300, 900, 0.01, 25)
		@alive = true

	update: ->
		velocity_vector = Peach.Geometry.Point.fromPolar(
			@accelerator.current_speed,
			@heading + Math.PI / 2
		);

		delta_time = Peach.gameState.frameTime / 1000.0
		delta_position = velocity_vector.scale(delta_time)

		@position = @position.add(delta_position)
		@heading += @turner.current_turn_angle * delta_time * velocity_vector.magnitude() / 10

		@accelerator.update()
		@turner.update()

	draw: ->
		console.log @position
		console.log @heading


module.exports = CarState

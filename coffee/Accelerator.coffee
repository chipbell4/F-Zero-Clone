class Accelerator
	constructor: (@max_speed, @acceleration_fallof, @deceleration_factor) ->
		@current_speed = 0
		@alive = true

	current_acceleration: ->
		return @acceleration_fallof * (@max_speed - @current_speed)
	
	accelerate: (time_step) ->
		@current_speed += time_step * @current_acceleration()
		@current_speed = Math.min(@current_speed, @max_speed)

	decelerate: (time_step) ->
		@current_speed -= time_step * @deceleration_factor
		@current_speed = Math.max(@current_speed, 0)

	update: ->
		time_step = Peach.gameState.frameTime / 1000.0;

		if Peach.Input.state.keys['up']
			@accelerate(time_step)
		else
			@decelerate(time_step)

	draw: ->
		console.log(@current_speed)

module.exports = Accelerator

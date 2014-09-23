class Accelerator
	constructor: (@max_speed, @initial_acceleration, @acceration_falloff, @deceleration_factor) ->
		@current_speed = 0
		@alive = true
	
	accelerate: ->
		@current_speed += @initial_acceleration * Math.exp( -@acceration_falloff * @current_speed)
		@current_speed = Math.min(@current_speed, @max_speed)

	decelerate: ->
		@current_speed -= @deceleration_factor
		@current_speed = Math.max(@current_speed, 0)

	update: ->
		if Peach.Input.state.keys['up']
			@accelerate()
		else
			@decelerate()

	draw: ->
		console.log(@current_speed)

module.exports = Accelerator

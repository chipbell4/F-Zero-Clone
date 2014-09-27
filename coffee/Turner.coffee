class Turner
	constructor: (@max_turn_angle, @max_turn_angle_velocity, @turn_angle_at_max_velocity, @max_velocity, @turn_rate_factor) ->
		@current_turn_angle = 0
		@alive = true
		@velocity = 0

	calculateMaxTurnAngleForVelocity: () ->
		if @velocity < @max_turn_angle_velocity
			return @max_turn_angle / @max_turn_angle_velocity * @velocity
		else
			slope = (@max_turn_angle - @turn_angle_at_max_velocity) / (@max_velocity - @max_turn_angle_velocity)
			theta_intercept = @turn_angle_at_max_velocity - slope * @max_velocity
			return slope * @velocity + theta_intercept

	straighten: (delta_time) ->
		@current_turn_angle = 0

	update: ->
		delta_time = Peach.gameState.frameTime / 1000;
		if Peach.Input.state.keys['left']
			@current_turn_angle -= @turn_rate_factor * delta_time
		else if Peach.Input.state.keys['right']
			@current_turn_angle += @turn_rate_factor * delta_time
		else
			@straighten(delta_time)

		# clamp
		max_turn_angle = @calculateMaxTurnAngleForVelocity(@velocity)
		@current_turn_angle = Math.max(@current_turn_angle, -max_turn_angle)
		@current_turn_angle = Math.min(@current_turn_angle, max_turn_angle)

	draw: ->

module.exports = Turner

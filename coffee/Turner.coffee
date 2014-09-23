class Turner
	constructor: (@max_turn_angle, @turn_speed, @wheel_straightening_factor) ->
		@current_turn_angle = 0
		@alive = true

	straighten: (delta_time) ->
		if @current_turn_angle < 0
			@current_turn_angle += delta_time * @wheel_straightening_factor
		else if @current_turn_angle > 0
			@current_turn_angle -= delta_time * @wheel_straightening_factor

		if Math.abs(@current_turn_angle) < @wheel_straightening_factor
			@current_turn_angle = 0

	update: ->
		delta_time = Peach.gameState.frameTime / 1000;
		if Peach.Input.state.keys['left']
			@current_turn_angle -= @turn_speed * delta_time
		else if Peach.Input.state.keys['right']
			@current_turn_angle += @turn_speed * delta_time
		else
			@straighten(delta_time)

		# clamp
		@current_turn_angle = Math.max(@current_turn_angle, -@max_turn_angle)
		@current_turn_angle = Math.min(@current_turn_angle, @max_turn_angle)

	draw: ->
		console.log @current_turn_angle

module.exports = Turner

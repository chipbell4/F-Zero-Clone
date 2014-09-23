class Turner
	constructor: (@max_turn_angle, @turn_speed, @wheel_straightening_factor) ->
		@current_turn_angle = 0
		@alive = true

	straighten: ->
		if @current_turn_angle < 0
			@current_turn_angle += @wheel_straightening_factor
		else if @current_turn_angle > 0
			@current_turn_angle -= @wheel_straightening_factor

	update: ->
		delta_turn = @turn_speed * Peach.gameState.frameTime / 1000;
		if Peach.Input.state.keys['left']
			@current_turn_angle -= delta_turn
		else if Peach.Input.state.keys['right']
			@current_turn_angle += delta_turn
		else
			@straighten()

		# clamp
		@current_turn_angle = Math.max(@current_turn_angle, -@max_turn_angle)
		@current_turn_angle = Math.min(@current_turn_angle, @max_turn_angle)

	draw: ->
		console.log @current_turn_angle

module.exports = Turner

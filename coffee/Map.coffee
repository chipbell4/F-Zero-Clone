class Map
	constructor: (@car_world_position, @car_screen_position)->
		@heading = 0
		@image = new Image
		@image.src = '/images/map.png'
		@alive = true
		@angle = 0

	draw: ->
		Peach.context.save()
		#Peach.context.translate(
		Peach.context.drawImage(@image, @draw_position.x, @draw_position.y, 10000, 5000)
		Peach.context.restore()

	update: ->

module.exports = Map

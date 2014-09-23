class Map
	constructor: (@position)->
		@draw_position = @position
		@heading = 0
		@image = new Image
		@image.src = '/images/map.png'
		@alive = true
		@angle = 0

	draw: ->
		Peach.context.save()
		Peach.context.translate(-@position.x, -@position.y)
		Peach.context.rotate(-@heading)
		Peach.context.drawImage(@image, @draw_position.x, @draw_position.y, 10000, 5000)
		Peach.context.restore()

	update: ->

module.exports = Map

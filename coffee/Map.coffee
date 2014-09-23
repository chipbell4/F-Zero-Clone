class Map
	constructor: ->
		@heading = 0
		@position = Peach.Geometry.Point.fromCartesian(200, 100)
		@image = new Image
		@image.src = '/images/map.png'
		@alive = true

	draw: ->
		Peach.context.save()
		Peach.context.translate(@position.x, @position.y)
		Peach.context.scale(1, 0.2)
		Peach.context.rotate(-@heading)
		Peach.context.translate(-@position.x, -@position.y)
		Peach.context.drawImage(@image, 0, 0, 800, 400)
		Peach.context.restore()

	update: ->

module.exports = Map

class Map
	constructor: ->
		@image = new Image
		@image.src = '/images/map.png'
		@alive = true
		
		@heading = 0
		@world_position = Peach.Geometry.Point.Origin
		@draw_position = Peach.Geometry.Point.Origin

	draw: ->
		Peach.context.save()
		Peach.context.translate(@world_position.x, @world_position.y)
		Peach.context.rotate(-@heading)
		Peach.context.translate(-@draw_position.x, @draw_position.y)
		#Peach.context.drawImage(@image, 0, 0, 10000, 5000)
		Peach.context.drawImage(@image, 0, 0, 200, 100)
		Peach.context.restore()

	update: ->

module.exports = Map

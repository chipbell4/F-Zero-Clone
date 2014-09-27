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
		Peach.context.translate(@draw_position.x, @draw_position.y)
		Peach.context.scale(1, 0.2)
		Peach.context.rotate(-@heading)
		Peach.context.translate(@world_position.x, @world_position.y)
		Peach.context.drawImage(@image, 0, 0, 20000, 10000)
		@axes()
		Peach.context.restore()

	update: ->

	axes: ->
		Peach.Primitive.line(
			Peach.Geometry.Point.Origin,
			Peach.Geometry.Point.fromCartesian(100, 0),
			'#0000ff',
		)
		Peach.Primitive.line(
			Peach.Geometry.Point.Origin,
			Peach.Geometry.Point.fromCartesian(0, 100),
			'#0000ff',
		)


module.exports = Map

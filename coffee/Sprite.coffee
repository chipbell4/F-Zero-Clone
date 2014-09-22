class Sprite
	constructor: (@sprite_sheet, @sprite_position, @sprite_crop) ->
		@image = new Image
		@image.src = @sprite_sheet
		@alive = true

	draw: ->
		console.log 'Drawing'
		Peach.context.drawImage(
			@image,
			@sprite_crop.top_left.x,
			@sprite_crop.top_left.y,
			@sprite_crop.width,
			@sprite_crop.height,
			@sprite_position.top_left.x,
			@sprite_position.top_left.y,
			@sprite_position.width,
			@sprite_position.height
		)
	
	update: ->

module.exports = Sprite;

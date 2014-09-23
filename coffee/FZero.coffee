# Assuming Peach is defined globally

Falcon = require './Falcon.coffee'
Map = require './Map.coffee'
CarState = require './CarState.coffee'

falcon = new Falcon
map = new Map(falcon.sprite_position.top_left)

FZero = 
	init: ->
		Peach.entities.push(map)
		Peach.entities.push(falcon)
		Peach.init('fzero-canvas')
		Peach.start()

window.FZero = FZero
window.map = map

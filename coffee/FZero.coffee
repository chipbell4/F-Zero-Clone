# Assuming Peach is defined globally

Falcon = require './Falcon.coffee'
Map = require './Map.coffee'
CarState = require './CarState.coffee'

FZero = 
	init: ->
		Peach.entities.push(new Map)
		Peach.entities.push(new Falcon)
		Peach.init('fzero-canvas')
		Peach.start()

window.FZero = FZero

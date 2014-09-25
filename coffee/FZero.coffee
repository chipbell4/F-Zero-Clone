# Assuming Peach is defined globally

Falcon = require './Falcon.coffee'
Map = require './Map.coffee'

falcon = new Falcon
map = new Map

FZero = 
	init: ->
		Peach.entities.push(map)
		Peach.entities.push(falcon)
		Peach.init('fzero-canvas')
		Peach.start()

window.FZero = FZero

# Assuming Peach is defined globally

Falcon = require './Falcon.coffee'

falcon = new Falcon

FZero = 
	init: ->
		Peach.entities.push(falcon)
		Peach.init('fzero-canvas')
		Peach.start()

window.FZero = FZero

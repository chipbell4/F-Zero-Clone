# Assuming Peach is defined globally

Falcon = require './Falcon.coffee'

FZero = 
	init: ->
		Peach.entities.push(new Falcon);
		Peach.init('fzero-canvas')
		Peach.start()

window.FZero = FZero

FZeroMap = require './FZeroMap.coffee'
Car = require './Car.coffee'
ChaseCamera = require './ChaseCamera.coffee'

FZero = 
	renderer: null
	scene: null
	camera: null
	keyboard: null
	last_time: null
	entities: []
	animate: ->
		time_diff = (+new Date()) - @last_time
		
		# Render the scene
		@renderer.render(@scene, @chase_camera.internal_camera)

		# Update state for each object
		item.update() for item in @entities

		# Call the animate function again, with the correct invocation context
		requestAnimationFrame(@animate.bind(this))

	init: ->
		@renderer = new THREE.WebGLRenderer()
		@renderer.setSize(window.innerWidth, window.innerHeight)
		document.body.appendChild(@renderer.domElement)

		# Create a keyboard listener
		@keyboard = new THREEx.KeyboardState

		# Setup the scene
		@scene = new THREE.Scene()
		falcon = new Car
		chase_camera = new ChaseCamera(falcon, 20, 10, 10)
		@entities.push(new FZeroMap)
		@entities.push(falcon)
		@entities.push(chase_camera)
		entity.addToScene(@scene) for entity in @entities

		@chase_camera = chase_camera

		# Animate
		@animate()

window.FZero = FZero

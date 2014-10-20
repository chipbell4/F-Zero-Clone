FZero = 
	renderer: null
	scene: null
	camera: null
	last_time: null
	entities: []
	animate: ->
		time_diff = (+new Date()) - @last_time
		
		# Render the scene
		@renderer.render(@scene, @camera)

		# Update state for each object
		item.update() for item in @entities

		# Call the animate function again, with the correct invocation context
		requestAnimationFrame(@animate.bind(this))

	init: ->
		@renderer = new THREE.WebGLRenderer()
		@renderer.setSize(window.innerWidth, window.innerHeight)
		document.body.appendChild(@renderer.domElement)

		@camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 1000)
		@camera.position.y = -450
		@camera.position.z = 400
		@camera.rotation.x = 45 * (Math.PI / 180)

		@scene = new THREE.Scene()

		plane = new THREE.Mesh(new THREE.PlaneGeometry(300, 300), new THREE.MeshNormalMaterial())
		plane.overdraw = true
		@scene.add(plane)

		@animate()

window.FZero = FZero

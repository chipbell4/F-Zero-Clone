class Car
	CAR_WIDTH: 40
	CAR_HEIGHT: 40

	constructor: ->
		@position = new THREE.Vector3(0, 0, 0)
		@heading = 0
		@velocity = 0

	addToScene: (scene) ->
		obj = 
			map: THREE.ImageUtils.loadTexture('/images/falcon.gif')
		@plane = new THREE.Mesh(
			new THREE.PlaneGeometry(3, 2),
			new THREE.MeshBasicMaterial(obj)
		)
		@plane.overdraw = true
		scene.add(@plane)

	update: ->

		if FZero.keyboard.pressed('left')
			@heading += 0.05
		
		if FZero.keyboard.pressed('right')
			@heading -= 0.05

		if FZero.keyboard.pressed('up')
			@velocity += 0.1
		else
			@velocity -= 0.05
			@velocity = Math.max(0, @velocity)

		velocity_vector = new THREE.Vector3(@velocity, 0, 0).applyAxisAngle(new THREE.Vector3(0, 0, 1), @heading)

		@position = @position.add(velocity_vector)
		@plane.position = @position

		@plane.rotation.order = 'ZYX'
		@plane.rotation.z = @heading
		@plane.rotation.y = -Math.atan2(FZero.chase_camera.chase_distance, FZero.chase_camera.chase_height);

module.exports = Car

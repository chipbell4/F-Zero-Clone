class ChaseCamera

	constructor: (@car, @chase_distance, @chase_height) ->
		@internal_camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 1000)
		@update()

	update: ->
		# set camera position behind the car
		offset_from_car = new THREE.Vector3(@chase_distance, 0, @chase_height)
			.applyAxisAngle(new THREE.Vector3(0, 0, 1), Math.PI + @car.heading)

		# move to that position and look at the car
		@internal_camera.position = @car.position.clone().add(offset_from_car)
		@internal_camera.lookAt(@car.position)
		@internal_camera.up = new THREE.Vector3(0, 0, 1)

	addToScene: (scene) ->

module.exports = ChaseCamera

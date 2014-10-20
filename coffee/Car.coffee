class Car
	CAR_WIDTH: 40
	CAR_HEIGHT: 40

	constructor: ->
		@position = new THREE.Vector3(0, 0, 0)
		@heading = 0

	addToScene: (scene) ->
		@plane = new THREE.Mesh(
			new THREE.PlaneGeometry(50, 50),
			new THREE.MeshBasicMaterial()
		)
		@plane.overdraw = true
		scene.add(@plane)

	update: ->
		@plane.lookAt(FZero.camera.position)

module.exports = Car

class Falcon
	addToScene: (scene) ->
		@plane = new THREE.Mesh(
			new THREE.PlaneGeometry(50, 50),
			new THREE.MeshBasicMaterial()
		)
		@plane.overdraw = true
		scene.add(@plane)

	update: ->
		@plane.lookAt(FZero.camera.position)

module.exports = Falcon;

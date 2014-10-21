class FZeroMap
	constructor: ->
		@map_url = '/images/map.png'
		
	addToScene: (scene) ->
		obj = 
			map: THREE.ImageUtils.loadTexture(@map_url)
		@plane = new THREE.Mesh(
			new THREE.PlaneGeometry(300, 300),
			new THREE.MeshBasicMaterial(obj)
		)
		@plane.overdraw = true
		scene.add(@plane)

	update: ->

module.exports = FZeroMap

function init() {
	var WIDTH = 400,
		 HEIGHT = 300;

	// set some camera attributes
	var VIEW_ANGLE = 45,
		 ASPECT = WIDTH / HEIGHT,
		 NEAR = 0.1,
		 FAR = 10000;

	// create a WebGL renderer, camera
	// and a scene
	var renderer = new THREE.WebGLRenderer();
	var camera =
	new THREE.PerspectiveCamera(
			VIEW_ANGLE,
			ASPECT,
			NEAR,
			FAR);

	var scene = new THREE.Scene();

	// add the camera to the scene
	scene.add(camera);

	// the camera starts at 0,0,0
	// so pull it back
	camera.position.z = 300;

	// start the renderer
	renderer.setSize(WIDTH, HEIGHT);

	// attach the render-supplied DOM element
	var body = document.getElementsByTagName('body')[0];
	body.appendChild(renderer.domElement);

	buildScene(scene);

	renderer.render(scene, camera);
}

function buildScene(scene) {
	// set up the sphere vars
	var radius = 50,
		 segments = 16,
		 rings = 16;

	var sphereMaterial =
	  new THREE.MeshLambertMaterial({color: 0xCC0000});

	var sphere = new THREE.Mesh(
			new THREE.SphereGeometry(
				radius,
				segments,
				rings),
			sphereMaterial);

	// add the sphere to the scene
	scene.add(sphere);

	// create a point light
	var pointLight =
	  new THREE.PointLight(0xFFFFFF);

  // set its position
  pointLight.position.x = 10;
  pointLight.position.y = 50;
  pointLight.position.z = 130;

  // add to the scene
  scene.add(pointLight);
}

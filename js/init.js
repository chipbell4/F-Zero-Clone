;var FZero = FZero || {};
FZero.drawState = {};

var WIDTH = 400;
var HEIGHT = 300;

FZero.init = function(){
	// poly-fill animation frame
	window.requestAnimationFrame = window.requestAnimationFrame 
		|| window.mozRequestAnimationFrame
		|| window.webkitRequestAnimationFrame;

	FZero.buildScene();
	FZero.addObjectsToScene();
	FZero.attachToDom();
	FZero.draw();
}

FZero.buildScene = function() {
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

	FZero.drawState.renderer = renderer;
	FZero.drawState.scene = scene;
	FZero.drawState.camera = camera;
}

FZero.addObjectsToScene = function() {
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
	FZero.drawState.scene.add(sphere);

	// create a point light
	var pointLight =
	  new THREE.PointLight(0xFFFFFF);

  // set its position
  pointLight.position.x = 10;
  pointLight.position.y = 50;
  pointLight.position.z = 130;

  // add to the scene
  FZero.drawState.scene.add(pointLight);
}

FZero.attachToDom = function() {
	// attach the render-supplied DOM element
	var body = document.getElementsByTagName('body')[0];
	body.appendChild(FZero.drawState.renderer.domElement);
}

;var FZero = FZero || {};
FZero.drawState = {};
FZero.gameState = {};
FZero.gameState.last_time = -1;
FZero.gameState.current_time = -1;

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
	//FZero.draw();
	FZero.loop();
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
	var geometry = new THREE.CubeGeometry( 100, 100, 100 );
	var material = new THREE.MeshBasicMaterial( { color: 0xff0000, wireframe: true } );
	FZero.drawState.mesh = new THREE.Mesh( geometry, material );
	FZero.drawState.scene.add(FZero.drawState.mesh);
}

FZero.attachToDom = function() {
	// attach the render-supplied DOM element
	var body = document.getElementsByTagName('body')[0];
	body.appendChild(FZero.drawState.renderer.domElement);
}

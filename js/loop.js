;var FZero = FZero || {};

FZero.loop = function() {
	FZero.update();
	FZero.draw();
	window.requestAnimationFrame(FZero.loop);
}

FZero.draw = function() {
	FZero.drawState.renderer.render(FZero.drawState.scene, FZero.drawState.camera);
}

FZero.update = function() {
	FZero.updateTimestep();

	var t = FZero.getTimeElapsed();
	// rotate based on the time
	FZero.drawState.mesh.rotation.x = t / 5 * 2 * Math.PI;
	FZero.drawState.mesh.rotation.y = t / 4 * 2 * Math.PI;
	FZero.drawState.mesh.rotation.z = t / 6 * 2 * Math.PI;

}

FZero.updateTimestep = function() {
	var timestamp = new Date().getTime();
	if(FZero.gameState.last_time < 0) {
		FZero.gameState.current_time = timestamp;
		FZero.gameState.start_time = timestamp;
	}
	FZero.gameState.last_time = FZero.current_time;
	FZero.gameState.current_time = timestamp;
}

FZero.getTimestep = function() {
	return (FZero.gameState.current_time - FZero.gameState.last_time) / 1000.0;
}

FZero.getTimeElapsed = function() {
	return (FZero.gameState.current_time - FZero.gameState.start_time) / 1000.0;
}

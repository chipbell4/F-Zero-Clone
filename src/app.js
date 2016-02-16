var KeyboardState = require('./KeyboardState');
var GameManager = require('./GameManager');

// Initialize
KeyboardState.init();
GameManager.init({ width: 800, height: 600 });

GameManager.start();

var PIXI = require('pixi.js');
var KeyboardState = require('./KeyboardState');
var GameManager = require('./GameManager');

PIXI.loader
  .add('assets/falcon.json')
  .load(function() {
    // Initialize
    KeyboardState.init();
    GameManager.init({ width: 800, height: 600 });

    GameManager.start();
  });


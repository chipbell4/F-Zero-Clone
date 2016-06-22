var PIXI = require('pixi.js');
var KeyboardState = require('./KeyboardState');
var GameManager = require('./GameManager');
var Car = require('./Car');

PIXI.loader
  .add('assets/falcon.json')
  .load(function() {
    // Initialize
    KeyboardState.init();
    GameManager.init({ width: 800, height: 600 });

    var car = new Car();
    GameManager.addEntity(car);

    GameManager.start();
  });


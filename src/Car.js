var PIXI = require('pixi.js');

var Car = function() {
  this.isAlive = true;
  this.sprite = new PIXI.Sprite(PIXI.resources['assets/falcon.json'].textures['forward.png']);
};

Car.prototype.update = function() {
};

module.exports = Car;

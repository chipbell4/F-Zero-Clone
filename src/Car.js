var PIXI = require('pixi.js');

var Car = function() {
  this.isAlive = true;
  var texture = PIXI.loader.resources['assets/falcon.json'].textures['forward.png'];
  this.sprite = new PIXI.Sprite(texture);
  this.sprite.anchor.x = this.sprite.anchor.y = 0.5;
  this.sprite.position.x = this.sprite.position.y = 200;
};

Car.prototype.update = function() {
};

module.exports = Car;

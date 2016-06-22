var PIXI = require('pixi.js');

var textureForTurnDirection = function(direction) {
  var textureName = 'forward.png';
  if(direction !== 0) {
    textureName = 'left' + Math.abs(direction) + '.png';
  }
  return PIXI.loader.resources['assets/falcon.json'].textures[textureName];
};

var Car = function() {
  this.isAlive = true;
  this.turnDirection = -1;
  var texture = textureForTurnDirection(this.turnDirection);
  this.sprite = new PIXI.Sprite(texture);
  this.sprite.anchor.x = this.sprite.anchor.y = 0.5;
  this.sprite.position.x = this.sprite.position.y = 200;
};

Car.prototype.update = function(dt) {
};

module.exports = Car;

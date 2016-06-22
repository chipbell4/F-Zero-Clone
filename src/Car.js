var PIXI = require('pixi.js');
var KeyboardState = require('./KeyboardState');

var TURN_ANIMATION_SPEED = 0.25;

var textureForTurnDirection = function(direction) {
  var textureName = 'forward.png';
  if(direction !== 0) {
    textureName = 'left' + Math.abs(direction) + '.png';
  }
  return PIXI.loader.resources['assets/falcon.json'].textures[textureName];
};

var scaleForTurnDirection = function(direction) {
  // the sprite is left facing
  return direction > 0 ? -1 : 1;
}

var Car = function() {
  this.isAlive = true;
  this.turnDirection = -1;
  var texture = textureForTurnDirection(this.turnDirection);
  this.sprite = new PIXI.Sprite(texture);
  this.sprite.anchor.x = this.sprite.anchor.y = 0.5;
  this.sprite.position.x = this.sprite.position.y = 200;

  this.turnTime = 0;
};

Car.prototype.update = function(dt) {
  this.turnTime += dt;
  var noKeys = !KeyboardState.left && !KeyboardState.right;
  var needsToTurn = this.turnTime > TURN_ANIMATION_SPEED;

  if(needsToTurn && KeyboardState.right) {
    this.turnTime = 0;
    this.turnDirection += 1;
    this.turnDirection = Math.min(3, this.turnDirection);
  } else if(needsToTurn && KeyboardState.left) {
    this.turnTime = 0;
    this.turnDirection -= 1;
    this.turnDirection = Math.max(-3, this.turnDirection);
  } else if(needsToTurn && noKeys && this.turnDirection !== 0) {
    this.turnTime = 0;
    this.turnDirection -= this.turnDirection / Math.abs(this.turnDirection);
  }

  this.sprite.texture = textureForTurnDirection(this.turnDirection);
  this.sprite.scale.x = scaleForTurnDirection(this.turnDirection);
};

module.exports = Car;

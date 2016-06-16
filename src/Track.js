var Track = function(options) {
  this.isAlive = true;

  this.sprite = PIXI.Sprite.fromImage(options.image);
  this.sprite.width = options.width;
  this.sprite.height = options.height;


};

Track.prototype.update = function() {
};

module.exports = Track;

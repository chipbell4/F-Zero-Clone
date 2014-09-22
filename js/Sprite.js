var Sprite = function(sprite_sheet, sprite_position, sprite_crop) {
	// set some private variables
	this.sprite_position = sprite_position;
	this.sprite_crop = sprite_crop;
	this.alive = true;

	// Preload the image
	this.image = new Image();
	this.image.src = sprite_sheet;
};

Sprite.prototype.draw = function() {
	Peach.context.drawImage(
		this.image,
		this.sprite_crop.top_left.x,
		this.sprite_crop.top_left.y,
		this.sprite_crop.width,
		this.sprite_crop.height,
		this.sprite_position.top_left.x,
		this.sprite_position.top_left.y,
		this.sprite_position.width,
		this.sprite_position.height
	);
};

Sprite.prototype.update = function() { };

module.exports = Sprite;

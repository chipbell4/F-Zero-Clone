var PIXI = require('pixi.js');
var stage = null;
var renderer = null;
var lastTimestamp = null;
var entities = [];

module.exports = {
  init: function(dimensions) {
    stage = new PIXI.Stage(0xffffff);
    window.stage = stage;
    renderer = PIXI.autoDetectRenderer(dimensions.width, dimensions.height);
    document.body.appendChild(renderer.view);
  },

  addEntity: function(entity) {
    entities.push(entity);
    stage.addChild(entity.sprite);
  },

  start: function() {
    lastTimestamp = 0;

    requestAnimationFrame(this.animate.bind(this));
  },

  animate: function(timestamp) {
    // Update timestamps
    var dt = (timestamp - lastTimestamp) / 1000;
    lastTimestamp = timestamp;

    // filter out "dead" entities
    entities.filter(entity => !entity.isAlive).forEach(entity => stage.remove(entity.sprite));
    entities = entities.filter(entity => entity.isAlive);

    // run the "update" method for each entity, allowing them to push to entities
    var newEntities = [];
    entities.forEach(function(entity) {
      var children = entity.update(dt);

      if(children === undefined) {
        return;
      }

      newEntities = newEntities.concat(children);  
    });

    // Append new children
    entities.concat(newEntities);

    renderer.render(stage);

    // Try to animate again
    requestAnimationFrame(this.animate.bind(this));
  }
};

var lastTimestamp = null;
var entities = [];

module.exports = {
  addEntity: function(entity) {
    entities.push(entity);
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
    entities = entities.filter(function(entity) {
      return entity.isAlive;
    });

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

    // Try to animate again
    requestAnimationFrame(this.animate.bind(this));
  }
};

importantKeys = {
  38: 'up',
  40: 'down',
  37: 'left',
  39: 'right',
};

module.exports = {
  init: function() {
    document.addEventListener('keydown', this.onKeyDown.bind(this));
    document.addEventListener('keyup', this.onKeyUp.bind(this));

    // initialize each key to false
    var setFalseKey = function(keyCode) {
      var direction = importantKeys[keyCode];
      this[direction] = false;
    };

    Object.keys(importantKeys).forEach(setFalseKey.bind(this));
  },

  onKeyDown: function(event) {
    var direction = importantKeys[event.keyCode];

    if(direction === undefined) {
      return;
    }

    this[direction] = true;
  },

  onKeyUp: function(event) {
    var direction = importantKeys[event.keyCode];

    if(direction === undefined) {
      return;
    }

    this[direction] = false;
  },
};

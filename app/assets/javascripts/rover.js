function Rover(map, x, y, side, areaX, areaY, steps) {
  'use strict';

  this.areaX    = parseInt(areaX, 10);
  this.areaY    = parseInt(areaY, 10);
  this.interval = $('#interval').val();
  this.map      = map;
  this.message  = $('#message'); // TODO: spec
  this.side     = side;
  this.speed    = $('#speed').val();
  this.steps    = steps;
  this.x        = parseInt(x, 10);
  this.y        = parseInt(y, 10);
}

Rover.prototype.appear = function(step) {
  'use strict';

  var robot = this.robot();

  if (this.changed(step)) {
    robot.fadeIn(this.speed / 2);
  } else {
    robot.show();
  }
};

Rover.prototype.buildPlateau = function() {
  'use strict';

  var
    rows    = [],
    plateau = [];

  for (var i = 0; i <= this.areaY; i++) {
    var row = this.row();

    plateau[i] = [];

    for (var j = 0; j <= this.areaX; j++) {
      var column = this.column();

      plateau[i][j] = column;

      row.append(column);
    }

    rows.unshift(row);
  }

  this.map.append(rows);

  return plateau;
};

Rover.prototype.calculate = function(step) {
  'use strict';

  if ('x' in step) {
    this.x += parseInt(step.x, 10);
  } else if ('y' in step) {
    this.y += parseInt(step.y, 10);
  }

  this.side = step.side;
};

Rover.prototype.column = function() {
  'use strict';

  return $('<div />', { 'class': 'column' });
};

Rover.prototype.create = function() {
  'use strict';

  if (!this.plateau) {
    this.map.empty();

    this.plateau = this.buildPlateau();
  }

  return this;
};

Rover.prototype.destroy = function() {
  'use strict';

  this.remove();
};

Rover.prototype.icon = function() {
  'use strict';

  return $('<i />', { 'class': 'icon i-' + this.side }).hide();
};

Rover.prototype.occult = function() {
  'use strict';

  this.robot().fadeOut(this.speed / 2, this.destroy);
};

Rover.prototype.point = function() {
  'use strict';

  return this.plateau[this.y][this.x];
};

Rover.prototype.robot = function() {
  'use strict';

  return this.point().children('.icon');
};

Rover.prototype.row = function() {
  'use strict';

  return $('<div />', { 'class': 'row' });
};

Rover.prototype.stop = function(movement) {
  'use strict';

  clearInterval(movement);
};

Rover.prototype.walk = function() {
  'use strict';

  var icon = this.icon(this.side);

  this.point().html(icon);
};

//
Rover.prototype.changed = function(step) {
  'use strict';

  return step && (('x' in step) || ('y' in step));
};

Rover.prototype.show = function(message) {
  'use strict';

  this.message.text(message);
};

Rover.prototype.explore = function() {
  'use strict';

  var
    stepIndex = 0,
    step      = this.steps[stepIndex],
    that      = this;

  this.walk();
  this.appear(step);

  var movement = setInterval(function() {
    if (stepIndex === that.steps.length) {
      that.show(that.x + ' ' + that.y + ' ' + that.side);

      return that.stop(movement);
    }

    if (step.error) {
      that.stop(movement);

      return that.show(step.error);
    }

    that.occult();
    that.calculate(step);
    that.walk();
    that.appear(step);

    step = that.steps[++stepIndex];
  }, that.interval);
};

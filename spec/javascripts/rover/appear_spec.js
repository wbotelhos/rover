describe('#appear', function() {
  'use strict';

  var
    areaX = 5,
    areaY = 5,
    side  = 'north',
    x     = 0,
    y     = 0;

  beforeEach(function() {
    this.map = $('<div />', { id: 'map' }).appendTo('body');
  });

  afterEach(function() {
    this.map.remove();
  });

  context ('when is a movement', function() {
    var steps = [{ x: 1 }];

    it ('shows the robot on next point with fade', function() {
      // given
      var
        point = $('<div />'),
        robot = $('<div />').appendTo(point),
        rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

      rover.plateau = [[point]];

      spyOn($.fn, 'fadeIn');

      // when
      rover.appear(steps[0]);

      // then
      expect(robot.fadeIn).toHaveBeenCalledWith(rover.speed / 2);
    });
  });

  context ('when is a turn', function() {
    var steps = [{ side: 'east' }];

    it ('shows the robot of current point', function() {
      // given
      var
        point = $('<div />'),
        robot = $('<div />').appendTo(point),
        rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

      rover.plateau = [[point]];

      spyOn($.fn, 'show');

      // when
      rover.appear(steps[0]);

      // then
      expect(robot.show).toHaveBeenCalled();
    });
  });
});

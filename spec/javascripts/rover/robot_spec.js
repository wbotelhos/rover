describe('#robot', function() {
  'use strict';

  var
    areaX = 5,
    areaY = 5,
    side  = 'north',
    steps = [{ x: 1 }],
    x     = 0,
    y     = 0;

  beforeEach(function() {
    this.map = $('<div />', { id: 'map' }).appendTo('body');
  });

  afterEach(function() {
    this.map.remove();
  });

  it ('returns the robot', function() {
    // given
    var
      point = $('<div />'),
      robot = $('<b />').appendTo(point),
      rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    rover.plateau = [[point]];

    // when
    var robot = rover.robot();

    // then
    expect(robot).toBe(robot);
  });
});

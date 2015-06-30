describe('#destroy', function() {
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

  it ('shows the robot of current point', function() {
    // given
    var
      point = $('<div />'),
      robot = $('<div />').appendTo(point),
      rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    rover.plateau = [[point]];

    spyOn($.fn, 'fadeIn');

    // when
    rover.destroy.call(robot);

    // then
    expect(point.children().length).toEqual(0);
  });
});

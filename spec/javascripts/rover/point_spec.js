describe('#point', function() {
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

  it ('returns the y x element of plateau', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    rover.create();

    // when
    var point = rover.point();

    // then
    expect(point).toEqual(rover.plateau[y][x]);
  });
});

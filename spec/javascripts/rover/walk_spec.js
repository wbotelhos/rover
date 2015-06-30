describe('#walk', function() {
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

  it ('sets the icon into current point', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    rover.create();

    spyOn(rover, 'icon').and.returnValue('icon');

    // when
    rover.walk();

    // then
    expect(rover.plateau[0][0].text()).toEqual('icon');
  });
});

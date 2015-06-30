describe('#stop', function() {
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

  it ('clear the movement interval', function() {
    // given
    var
      movement = 0,
      rover    = new Rover(this.map, x, y, side, areaX, areaY, steps);

    spyOn(window, 'clearInterval');

    // when
    rover.stop(movement);

    // then
    expect(window.clearInterval).toHaveBeenCalledWith(movement);
  });
});

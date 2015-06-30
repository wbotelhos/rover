describe('#icon', function() {
  'use strict';

  var
    areaX = 5,
    areaY = 5,
    side  = 'north',
    steps = [{ x: 1 }],
    x     = 0,
    y     = 0,
    rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

  beforeEach(function() {
    this.map = $('<div />', { id: 'map' }).appendTo('body');
  });

  afterEach(function() {
    this.map.remove();
  });

  it ('returns an icon with current side', function() {
    // given
    rover.side = 'side';

    // when
    var icon = rover.icon();

    // then
    expect(icon[0].className).toEqual('icon i-side');
  });

  it ('comes hidden', function() {
    // when
    var icon = rover.icon();

    // then
    expect(icon.css('display')).toEqual('none');
  });
});

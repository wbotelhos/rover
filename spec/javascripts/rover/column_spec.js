describe('#column', function() {
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

  it ('returns a column element', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    // when
    var column = rover.column();

    // then
    expect(column[0].tagName).toEqual('DIV');
  });

  it ('has a class', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    // when
    var column = rover.column();

    // then
    expect(column[0].className).toEqual('column');
  });
});

describe('#contructor', function() {
  'use strict';

  beforeEach(function() {
    this.map      = $('<div />', { id: 'map' }).appendTo('body');
    this.speed    = $('<div />', { id: 'speed', value: 1 }).appendTo('body');
    this.interval = $('<div />', { id: 'interval', value: 2 }).appendTo('body');
  });

  afterEach(function() {
    this.map.remove();
    this.speed.remove();
    this.interval.remove();
  });

  it ('initiates the variables', function() {
    // given
    var
      areaX = 5,
      areaY = 5,
      side  = 'north',
      steps = [{ x: 1 }],
      x     = 0,
      y     = 0;

    // when
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    // then
    expect(rover.areaX).toEqual(areaX);
    expect(rover.areaY).toEqual(areaY);
    expect(rover.interval).toEqual(this.interval.val());
    expect(rover.map).toEqual(this.map);
    expect(rover.side).toEqual(side);
    expect(rover.speed).toEqual(this.speed.val());
    expect(rover.steps).toEqual(steps);
    expect(rover.x).toEqual(x);
    expect(rover.y).toEqual(y);
  });

  it ('converts string number into number', function() {
    // given
    var
      areaX = '5',
      areaY = '5',
      side  = 'north',
      steps = [{ x: 1 }],
      x     = '0',
      y     = '0';

    // when
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    // then
    expect(typeof rover.areaX).toEqual('number');
    expect(typeof rover.areaY).toEqual('number');
    expect(typeof rover.x).toEqual('number');
    expect(typeof rover.y).toEqual('number');
  });
});

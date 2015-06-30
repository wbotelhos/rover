describe('#create', function() {
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

  it ('builds the plateau', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    spyOn(rover, 'buildPlateau').and.callThrough();

    // when
    rover.create();

    // then
    expect(rover.buildPlateau).toHaveBeenCalled();
  });

  it ('is channing', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    // when
    var self = rover.create();

    // then
    expect(self).toBe(rover);
  });

  it ('cleans the map', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    spyOn(rover.map, 'empty');

    // when
    rover.create();

    // then
    expect(rover.map.empty).toHaveBeenCalled();
  });

  context ('when plateau is already builded', function() {
    it ('does not builds the plateau', function() {
      // given
      var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

      rover.plateau = true;

      spyOn(rover, 'buildPlateau').and.callThrough();

      // when
      rover.create();

      // then
      expect(rover.buildPlateau).not.toHaveBeenCalled();
    });

    it ('does not cleans the map', function() {
      // given
      var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

      rover.plateau = true;

      spyOn(rover.map, 'empty');

      // when
      rover.create();

      // then
      expect(rover.map.empty).not.toHaveBeenCalled();
    });
  });
});

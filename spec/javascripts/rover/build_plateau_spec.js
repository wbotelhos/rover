describe('#buildPlateau', function() {
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

  it ('builds the right number of rows and columns', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    rover.areaX = 1;
    rover.areaY = 2;

    // when
    var plateau = rover.buildPlateau();

    // then
    expect(plateau.length).toEqual(3);
    expect(plateau[0].length).toEqual(2);
  });

  it ('populates the plateau points with right column and row elements', function() {
    // given
    var
      column = 'column',
      rover  = new Rover(this.map, x, y, side, areaX, areaY, steps),
      row    = $('<b />');

    rover.areaX = 3;
    rover.areaY = 2;

    spyOn(rover, 'column').and.returnValue(column);
    spyOn(rover, 'row').and.returnValue(row);

    // when
    var plateau = rover.buildPlateau();

    // then
    expect(plateau[0]).toEqual(['column', 'column', 'column', 'column']);
    expect(plateau[1]).toEqual(['column', 'column', 'column', 'column']);
    expect(plateau[2]).toEqual(['column', 'column', 'column', 'column']);
  });

  it ('populates the map', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    rover.areaX = 3;
    rover.areaY = 2;

    // when
    rover.buildPlateau();

    // then
    var
      lines = this.map.children('div'),
      rows1 = lines.eq(0).children('div'),
      rows2 = lines.eq(1).children('div'),
      rows3 = lines.eq(2).children('div');

    expect(lines.length).toEqual(3);
    expect(rows1.length).toEqual(4);
    expect(rows2.length).toEqual(4);
    expect(rows3.length).toEqual(4);
  });
});

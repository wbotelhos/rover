describe('#calculate', function() {
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

  context ('when step is about x', function() {
    context ('positive', function() {
      xit ('adds that value', function() {
        // given
        var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

        rover.x = 1;
        rover.y = 1;

        // when
        rover.calculate({ x: 1 });

        // then
        expect(rover.x).toEqual(2);
        expect(rover.y).toEqual(1);
      });
    });

    context ('negative', function() {
      xit ('adds that value', function() {
        // given
        var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

        rover.x = 1;
        rover.y = 1;

        // when
        rover.calculate({ x: -1 });

        // then
        expect(rover.x).toEqual(0);
        expect(rover.y).toEqual(1);
      });
    });
  });

  context ('when step is about y', function() {
    context ('positive', function() {
      xit ('adds that value', function() {
        // given
        var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

        rover.x = 1;
        rover.y = 1;

        // when
        rover.calculate({ y: 1 });

        // then
        expect(rover.x).toEqual(1);
        expect(rover.y).toEqual(2);
      });
    });

    context ('negative', function() {
      it ('adds that value', function() {
        // given
        var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

        rover.x = 1;
        rover.y = 1;

        // when
        rover.calculate({ y: -1 });

        // then
        expect(rover.x).toEqual(1);
        expect(rover.y).toEqual(0);
      });
    });
  });

  it ('sets the current side', function() {
    // given
    var rover = new Rover(this.map, x, y, side, areaX, areaY, steps);

    rover.x = 1;
    rover.y = 1;

    // when
    rover.calculate({ x: 1, side: 'side' });

    // then
    expect(rover.side).toEqual('side');
  });
});

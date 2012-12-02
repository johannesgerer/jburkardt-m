function grid_polar ( xcenter, ycenter, rmin, rmax, nr, angmin, angmax, nang )

%*****************************************************************************80
%
%% GRID_POLAR draws evenly spaced grid lines for polar coordinates.
%
%  Example:
%
%    r = rand ( 100, 1 );
%    t = pi * rand ( 100, 1 );
%    plot ( r .* cos ( t ), r .* sin ( t ), 'b*' );
%    axis equal
%    axis square
%    grid_polar ( 0.0, 0.0, 0.1, 1.0, 10, 0, 360, 16 );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XCENTER, YCENTER, are the X and Y coordinates
%    of the origin of the polar grid.  The point (XCENTER,YCENTER)
%    will correspond to a radial value of 0.
%
%    Input, real RMIN, RMAX, are the radial limits of the grid.
%    RMIN should be zero or greater.
%    RMAX should be "within" your picture.  For instance, if you
%    are using the simple DRAWCGM coordinate system, which uses 0
%    as the minimum X value and 1 as the maximum X value, then
%    XCENTER-RMAX should be no less than 0,
%    XCENTER+RMAX should be no greater than 1,
%    YCENTER-RMAX should be no less than 0,
%    YCENTER+RMAX should be no greater than 1.
%    If you have used SETWCD or SETSCL to allow a different range of
%    X and Y values, then RMAX must be selected in a similar way.
%
%    Input, integer NR, the number of circular grid lines to draw,
%    between RMIN and RMAX.  The value of NR is assumed to include
%    a grid circle drawn at R=RMIN.  However, if RMIN=0, this circle,
%    which will actually be just a point, won't be drawn.
%
%    Input, real ANGMIN, ANGMAX, are the angular limits of the grid.
%    Note that ANGMIN and ANGMAX are measured in DEGREES, and not
%    RADIANS!  This is strictly for user convenience, since it is
%    so much easier to say "90.0" rather than "3.14159265.../2.0",
%    for instance.
%    Be careful not to directly pass an integer constant as the
%    value of either argument.  ANGMIN and ANGMAX should be real
%    variables, or real constants.
%
%    Input, integer NANG, the number of grid lines drawn outward from
%    the origin, and evenly spaced through the angular range.
%
  color = [ .75, .75, .75 ];
%
%  Draw the circular grid lines.
%
  radius(1:nr) = linspace ( rmin, rmax, nr );

  for i = 1 : nr
 
    circular_arc ( xcenter, ycenter, radius(i), angmin, angmax );
 
  end
%
%  Draw the radial grid lines.
%
  angle(1:nang) = ( pi / 180 ) * linspace ( angmin, angmax, nang );

  for i = 1 : nang
  
    x1 = xcenter + rmin * cos ( angle(i) );
    y1 = ycenter + rmin * sin ( angle(i) );
 
    x2 = xcenter + rmax * cos ( angle(i) );
    y2 = ycenter + rmax * sin ( angle(i) );

    line ( [ x1, x2 ], [ y1, y2 ], 'Color', color );
 
  end
 
  return
end

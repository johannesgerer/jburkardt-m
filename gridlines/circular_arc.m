function circular_arc ( xcenter, ycenter, radius, angmin, angmax )

%*****************************************************************************80
%
%% CIRCULAR_ARC draws a circular arc of a given angular size and radius.
%
%  Discussion:
%
%    It is assumed that a plot has already been begun.
%
%  Example:
%
%    r = rand ( 100, 1 );
%    t = pi * rand ( 100, 1 );
%    plot ( r .* cos ( t ), r .* sin ( t ), 'b*' );
%    axis equal
%    axis square
%    circular_arc ( 0.0, 0.0, 1.0, 0, 180 );
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
%    Input, real XCENTER, YCENTER, the X and Y coordinates of
%    the center of the circle on which the arc lies.
%
%    Input, real RADIUS, the radius of the circle on which the arc lies.
%
%    Input, real ANGMIN, ANGMAX, the minimum and maximum
%    angles of the circle.  ANGMIN and ANGMAX are both
%    measured in degrees.  ANGMIN and ANGMAX determine the
%    portion of the circle to be drawn.  If ANGMIN=0.0 and
%    ANGMAX=90.0, for instance, an arc of 90 degrees will be drawn.
%
  color = [ 0.75, 0.75, 0.75 ];

  nval = 65;

  if ( radius == 0.0 )
    return
  end
%
%  Set up the data defining the circular arc, using NVAL equally
%  spaced points along the circumference.
%
  if ( nval == 1 )
    angle(1) = 0.5 * ( angmax + angmin );
  else
    angle(1:nval) = linspace ( angmin, angmax, nval );
  end

  xval(1:nval) = xcenter + radius * cos ( angle * pi / 180 );
  yval(1:nval) = ycenter + radius * sin ( angle * pi / 180 );

  line ( xval, yval, 'Color', color );
 
  return
end

function [ area, radout, side ] = polygon_inrad_data_2d ( n, radin )

%*****************************************************************************80
%
%% POLYGON_INRAD_DATA_2D determines polygonal data from its inner radius in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of sides of the polygon.
%    N must be at least 3.
%
%    Input, real RADIN, the inner radius of the polygon, that is,
%    the radius of the largest circle that can be inscribed within
%    the polygon.
%
%    Output, real AREA, the area of the regular polygon.
%
%    Output, real RADOUT, the outer radius of the polygon, that is,
%    the radius of the smallest circle that can be described about
%    the polygon.
%
%    Output, real SIDE, the length of one side of the polygon.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLYGON_INRAD_DATA_2D - Fatal error!\n' );
    fprintf ( 1, '  Input value of N must be at least 3\n' );
    fprintf ( 1, '  but your input value was N = %d\n', n );
    error ( 'POLYGON_INRAD_DATA_2D - Fatal error!' );
  end

  angle = pi / n;
  area = n * radin * radin * tan ( angle );
  side = 2.0 * radin * tan ( angle );
  radout = 0.5 * side / sin ( angle );

  return
end

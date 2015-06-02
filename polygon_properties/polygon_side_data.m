function [ area, radin, radout ] = polygon_side_data ( n, side )

%*****************************************************************************80
%
%% POLYGON_SIDE_DATA determines polygonal data from its side length.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
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
%    Input, real SIDE, the length of one side of the polygon.
%
%    Output, real AREA, the area of the regular polygon.
%
%    Output, real RADIN, the inner radius of the polygon, that is,
%    the radius of the largest circle that can be inscribed within
%    the polygon.
%
%    Output, real RADOUT, the outer radius of the polygon, that is,
%    the radius of the smallest circle that can be described about
%    the polygon.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLYGON_SIDE_DATA - Fatal error!\n' );
    fprintf ( 1, '  Input value of N must be at least 3.\n' );
    fprintf ( 1, '  but your input value was N = ', n );
    error ( 'POLYGON_SIDE_DATA - Fatal error!' );
  end

  angle = pi / n;
  area = 0.5 * n * side * side / tan ( angle );
  radin = 0.5 * side / tan ( angle );
  radout = 0.5 * side / sin ( angle );

  return
end

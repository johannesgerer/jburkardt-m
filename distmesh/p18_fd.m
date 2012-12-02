function d = p18_fd ( p )

%*****************************************************************************80
%
%% P18_FD is a signed distance function for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(NP,1:2), one or more points.
%
%    Output, real D(NP), the signed distance of each point to the boundary of the region.
%
  r1 = +1.0;
  r2 = +1.0;
  c1 = [ -2.0, 0.0 ];
  c2 = [ +2.0, 0.0 ];
%
%  Let the rectangle definition penetrate all the way to the center of the circles.
%
  width  = 2.0;
  height = 1.0 / 3.0;
  d1 = sqrt ( ( p(:,1) - c1(1) ).^2 + ( p(:,2) - c1(2) ).^2 ) - r1;
  d2 = sqrt ( ( p(:,1) - c2(1) ).^2 + ( p(:,2) - c2(2) ).^2 ) - r2;
  d3 = drectangle ( p, -width, +width, -height, +height );

  d = min ( d1, min ( d2, d3 ) );

  return
end

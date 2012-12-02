function d = p17_fd ( p )

%*****************************************************************************80
%
%% P17_FD is a signed distance function for problem 17.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P, one or more points.
%
%    Output, real D, the signed distance of each point to the boundary of the region.
%
  alpha = 0.0;

  d1 = drectangle ( p, 0.0, 5.0, -1.0, 1.0 );

  r = 0.5;

  cx1 = 2.0 + r * cos ( alpha );
  cy1 = 0.0 + r * sin ( alpha );
  dc1 = dcircle ( p, cx1, cy1, sqrt(3) * r );

  cx2 = 2.0 + r * cos ( alpha + 2 * pi / 3);
  cy2 = 0.0 + r * sin ( alpha + 2 * pi / 3);
  dc2 = dcircle ( p, cx2, cy2, sqrt(3) * r );

  cx3 = 2.0 + r * cos ( alpha + 4 * pi / 3);
  cy3 = 0.0 + r * sin ( alpha + 4 * pi / 3);
  dc3 = dcircle ( p, cx3, cy3, sqrt(3)*r );

  d2 = max ( max ( dc1, dc2 ), dc3 );

  d  = ddiff ( d1, d2 );

  return
end

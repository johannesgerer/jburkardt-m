function d = p15_fd ( p )

%*****************************************************************************80
%
%% P15_FD is a signed distance function for problem 15.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2006
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
  g1 = drectangle ( p, -8.0,  2.0, -1.0, 0.0 );
  g2 = drectangle ( p, -2.0,  8.0,  0.0, 1.0 );

  d = dunion ( g1, g2 );

  return
end

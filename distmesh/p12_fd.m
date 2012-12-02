function d = p12_fd ( p )

%*****************************************************************************80
%
%% P12_FD is a signed distance function for problem 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2006
%
%  Parameters:
%
%    Input, real P, one or more points.
%
%    Output, real D, the signed distance of each point to the boundary of the region.
%
  g1 = drectangle ( p, 0.000, 0.500, 0.000, 1.000 );
  g2 = drectangle ( p, 0.500, 0.625, 0.250, 0.375 );
  g3 = drectangle ( p, 0.625, 1.000, 0.000, 1.000 );

  d = dunion ( dunion ( g1, g2 ), g3 );

  return
end

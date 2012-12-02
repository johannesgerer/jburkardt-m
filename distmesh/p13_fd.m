function d = p13_fd ( p )

%*****************************************************************************80
%
%% P13_FD is a signed distance function for problem 13.
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
  g1 = drectangle ( p, 0.450, 0.550, 0.390, 0.900 );
  g2 = dcircle ( p, 0.500, 0.000, 0.400 );
  g3 = dcircle ( p, 0.500, 0.000, 0.300 );

  d = dunion ( g1, ...
    dintersect ( -p(:,2), ...
      ddiff ( g2, g3 ) ) );

  return
end

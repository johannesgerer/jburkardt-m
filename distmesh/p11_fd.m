function d = p11_fd ( p )

%*****************************************************************************80
%
%% P11_FD is a signed distance function for problem 11.
%
%  Discussion:
%
%    Problem 11 is the "L-shaped" region.
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
  g1 = drectangle ( p, 0.0, 1.0, 0.0, 0.5  );
  g2 = drectangle ( p, 0.0, 0.5, 0.0, 1.0 );

  d = dunion ( g1, g2 );

  return
end

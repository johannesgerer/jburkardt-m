function d = p22_fd ( p )

%*****************************************************************************80
%
%% P22_FD is a signed distance function for problem 22.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P, one or more points.
%
%    Output, real D, the signed distance of each point to the boundary.
%
  d1 = dcircle ( p, 0.0, 0.0, 1.0 );
  d2 = dcircle ( p, 0.0, 0.0, 0.4 );
  d12 = ddiff ( d1, d2 );

  d3 = drectangle ( p, 0.0, 1.0, -0.1, +0.1 );

  d = ddiff ( d12, d3 );

  return
end

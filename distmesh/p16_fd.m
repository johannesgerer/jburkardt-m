function d = p16_fd ( p )

%*****************************************************************************80
%
%% P16_FD is a signed distance function for problem 16.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2008
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
  global R1 R2

  d1 = dcircle ( p, 0.0, 0.0, R2 );
  d2 = dcircle ( p, 0.0, 0.0, R1 );
  d3 = p(:,1);
  d4 = p(:,2);

  d  = max ( d1, -d2 );
  d = max ( d, -d3 );
  d = max ( d, -d4 );

  return
end

function d = p19_fd ( p )

%*****************************************************************************80
%
%% P19_FD is a signed distance function for problem 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2009
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
  v = [ 0.50, 1.00; ...
        0.00, 0.75; ...
        0.95, 0.00; ...
        0.50, 1.00 ];

  d = dpoly ( p, v );

  return
end

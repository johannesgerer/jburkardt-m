function d = p23_fd ( p )

%*****************************************************************************80
%
%% P23_FD is a signed distance function for problem 23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P, one or more points.
%
%    Output, real D, the signed distance of each point to the boundary 
%    of the region.
%
  d = drectangle ( p, 0.0, 1.0, 0.0, 1.0 );

  return
end

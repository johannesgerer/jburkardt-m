function f = rhs ( n, node_xy, time )

%*****************************************************************************80
%
%% RHS gives the right-hand side of the differential equation.
%
%  Discussion:
%
%    We assume that the equation to be solved is
%
%      dUdT - Laplacian U + K * U = F
%
%    with
%
%      K = 0,
%
%    and
%
%      F = (2*pi*pi-1)*sin(pi*x)*sin(pi*y)*exp(-t).
%
%    The exact solution is:
%
%      U = sin(pi*x) * sin(pi*y) * exp(-t)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real NODE_XY(2,N), the coordinates of the points.
%
%    Input, real TIME, the current time (assumed to be
%    the initial time).
%
%    Output, real F(N), the value of the right hand side.
%
  f(1:n) = ( 2.0 * pi * pi - 1.0 ) ...
    * sin ( pi * node_xy(1,1:n) ) .* sin ( pi * node_xy(2,1:n) ) * exp ( - time );

  return
end


function f = rhs ( node_num, node_xy, time )

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
%  Modified:
%
%    07 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the points.
%
%    Input, real TIME, the current time (assumed to be
%    the initial time).
%
%    Output, real F(NODE_NUM), the value of the right hand side.
%
  f(1:node_num) = ( 2.0 * pi * pi - 1.0 ) ...
     * sin ( pi * node_xy(1,1:node_num) ) ...
    .* sin ( pi * node_xy(2,1:node_num) ) * exp ( - time );

  return
end

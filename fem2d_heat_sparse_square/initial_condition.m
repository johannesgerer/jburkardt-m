function u = initial_condition ( node_num, node_xy, time )

%*****************************************************************************80
%
%% INITIAL_CONDITION sets the initial condition.
%
%  Discussion:
%
%    The input value TIME is assumed to be the initial time.
%
%    We assume that the equation to be solved is
%
%      dUdT - Laplacian U + K * U = F
%
%    with K = 0, and F = (2*pi*pi-1)*sin(pi*x)*sin(pi*y)*exp(-t).
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
%    Output, real U(NODE_NUM), the value of the solution at the
%    the initial time.
%
  u(1:node_num) = sin ( pi * node_xy(1,1:node_num) ) ...
               .* sin ( pi * node_xy(2,1:node_num) ) ...
               * exp ( - time );

  return
end

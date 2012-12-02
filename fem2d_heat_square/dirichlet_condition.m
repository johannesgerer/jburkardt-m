function u = dirichlet_condition ( n, node_xy, time )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%    The input points (X,Y) are assumed to lie on the boundary of the
%    region.
%
%    This routine is set for the unit square.
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
%    Input, real TIME, the current time.
%
%    Output, real U(N), the value of the solution at the
%    the points.
%
  u(1:n) = sin ( pi * node_xy(1,1:n) ) .* sin ( pi * node_xy(2,1:n) ) * exp ( - time );

  return
end

function u = dirichlet_condition ( node_num, node_xy, time )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%    For efficiency, this routine may be called once, with all the
%    nodes input.  Of course, only those nodes that lie on the boundary
%    will need a meaningful value of U to be assigned.  Other nodes
%    may be given a dummy value for U.
%
%    This routine is set for the unit square.
%
%    We assume that the equation to be solved is
%
%      dUdT - Laplacian U + K * U = F
%
%    with 
%
%      K(X,Y,T) = 0
%      F(X,Y,T) = (2*pi*pi-1)*sin(pi*x)*sin(pi*y)*exp(-t).
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
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the points.
%
%    Input, real TIME, the current time.
%
%    Output, real U(NODE_NUM), the value of the solution at the
%    the points.
%
  u(1:node_num) = sin ( pi * node_xy(1,1:node_num) ) ...
               .* sin ( pi * node_xy(2,1:node_num) ) * exp ( - time );

  return
end

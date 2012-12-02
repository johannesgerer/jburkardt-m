function node_bc = dirichlet_condition ( node_num, node_xy )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%    This routine is set up for the lake region.
%
%    We assume an exact solution has been given.
%
%    We use the exact solution to evaluate our boundary condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM),
%    the coordinates of the points.
%
%    Output, real NODE_BC(NODE_NUM,1), the value of the
%    Dirichlet boundary conditions at the points.
%
  node_bc(1:node_num,1) = exact_solution ( node_num, node_xy );

  return
end


function node_rhs = rhs ( node_num, node_xy )

%*****************************************************************************80
%
%% RHS gives the right-hand side of the differential equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2012
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
%    Output, real NODE_RHS(NODE_NUM,1), the value of the
%    right hand side function at the points.
%
  node_rhs = zeros ( node_num, 1 );

  for j = 1 : node_num
    z = 4.0 - sqrt ( ( node_xy(1,j) - 2.0 ).^2 + ( node_xy(2,j) - 2.0 ).^2 );
    node_rhs(j,1) = max ( z, 0.0 );
  end

  return
end

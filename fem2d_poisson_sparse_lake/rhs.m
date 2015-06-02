function node_rhs = rhs ( node_num, node_xy )

%*****************************************************************************80
%
%% RHS gives the right-hand side of the differential equation.
%
%  Discussion:
%
%    This routine is set up for the lake region, with exact solution
%    U = ( X**2 + Y**2 ) / 500**2.
%
%    Hence, the right hand side of the equation is exactly
%    ( -4 + X**2 + Y**2 ) / 500**2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
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
  node_rhs(1:node_num,1) = ( -4.0                       ...
                         + node_xy(1,1:node_num).^2   ...
                         + node_xy(2,1:node_num).^2 ) ...
                         / ( 500.0 * 500.0 );

  return
end

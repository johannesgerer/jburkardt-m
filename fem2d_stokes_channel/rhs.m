function [ u_rhs, v_rhs, p_rhs ] = rhs ( node_num, node_xy )

%*****************************************************************************80
%
%% RHS gives the right-hand side of the differential equation.
%
%  Modified:
%
%    08 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, real XY(2,NODE_NUM), the coordinates of the points.
%
%    Output, real U_RHS(NODE_NUM), V_RHS(NODE_NUM), P_RHS(NODE_NUM), 
%    the right hand sides of the differential equations at the points.
%
  p_rhs(1:node_num) = 0.0;
  u_rhs(1:node_num) = 0.0;
  v_rhs(1:node_num) = 0.0;

  return
end

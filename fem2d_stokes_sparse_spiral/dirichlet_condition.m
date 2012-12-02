function [ u_bc, v_bc, p_bc ] = dirichlet_condition ( node_num, node_xy )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%                           Dirichlet
%                           U = V = 0
%
%                       1 +---------------+
%                         |               |
%                         |               |
%            Dirichlet    |               |  Dirichlet
%            U = V = 0    |               |  U = V = 0
%                         |               |
%                         |               |
%                         |               |
%                       0 +---------------+
%
%                         0               1
%
%                            Dirichlet
%                            U = V = 0
%
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Output, real U_BC(NODE_NUM), V_BC(NODE_NUM), P_BC(NODE_NUM), 
%    the values of the Dirichlet boundary conditions on horizontal 
%    velocity, vertical velocity, and pressure at the nodes.
%
  u_bc(1:node_num) = 0.0;
  v_bc(1:node_num) = 0.0;
  p_bc(1:node_num) = 0.0;

  return
end

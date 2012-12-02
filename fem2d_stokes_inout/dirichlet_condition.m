function [ u_bc, v_bc, p_bc ] = dirichlet_condition ( node_num, node_xy )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%                           Dirichlet
%                           U = 0  V = 0
%
%                       1 +---------------+
%                         |              -->  Neumann = 0
%                         |              -->
%            Dirichlet    |               |  Dirichlet
%            U = V = 0    |               |  U = V = 0
%                         |               |
%            Dirichlet   -->              |
%            Parabolic   -->              |
%                       0 +---------------+
%
%                         0               1
%
%                            Dirichlet
%                            U = V = 0
%
%
%  Modified:
%
%    20 October 2006
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
  tol = 0.0001;

  for node = 1 : node_num

    x = node_xy(1,node);
    y = node_xy(2,node);
%
%  Nodes along the lower part of the left boundary have a parabolic inflow.
%
    if ( x == 0.0 & ( 0.0 <= y & y <= 0.25 ) )
      u_bc(node) = 4.0 * y  * ( 0.25 - y ) / ( 0.25 * 0.25 );
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;
%
%  TEMPORARY FIX
%  Nodes along the upper part of the right boundary have a parabolic outflow.
%
    elseif ( x == 1.0 & ( 0.75 <= y & y <= 1.00 ) )
      u_bc(node) = 4.0 * ( y - 0.75 )  * ( 1.0 - y ) / ( 0.25 * 0.25 );
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;
%
%  All other constrained nodes have zero condition.
%
    else
      u_bc(node) = 0.0;
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;
    end

  end

  return
end

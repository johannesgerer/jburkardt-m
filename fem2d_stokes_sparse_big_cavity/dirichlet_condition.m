function [ u_bc, v_bc, p_bc ] = dirichlet_condition ( node_num, node_xy )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of any Dirichlet boundary conditions.
%
%  Discussion:
%
%
%                           Dirichlet
%                           U = 1  V = 0
%
%                       1 +--> --> --> -->+
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
%  Modified:
%
%    09 October 2006
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
%    Output, real U_BC(NODE_NUM), V_BC(NODE_NUM), P_BC(NODE_NUM), 
%    the values of the Dirichlet boundary conditions on horizontal 
%    velocity, vertical velocity, and pressure at the points.
%
  tol = 0.0001;

  for node = 1 : node_num

    x = node_xy(1,node);
    y = node_xy(2,node);

    if ( abs ( y - 1.0 ) <= tol )

      u_bc(node) = 1.0;
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;

    else

      u_bc(node) = 0.0;
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;

    end

  end

  return
end

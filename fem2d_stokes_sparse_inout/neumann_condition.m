function [ u_bc, v_bc, p_bc ] = neumann_condition ( node_num, node_xy )

%% NEUMANN_CONDITION sets the value of any Neumann boundary conditions.
%
%  Discussion:
%
%    Note that, at the moment, we are simply trying to implement
%    ZERO Neumann boundary conditions, and are not ready to try
%    to implement the NONZERO case.  Therefore, setting nonzero values
%    here is unlikely to work for some time%
%
%
%    Neumann boundary conditions might be applied to none, some, or
%    all the boundary nodes, and might apply to any combination of
%    U, V, and P.
%
%    This routine will be asked to supply a right hand side for the
%    Neumann conditions for U, V and P at EVERY node.  Simply set
%    the value to zero for nodes and variables at which a Neumann
%    condition is not being applied.  But set an appropriate value
%    to U_BC, V_BC or P_BC in cases where a Neumann condition is
%    being applied for that degree of freedom at that node.
%
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
%    the values of the boundary conditions on horizontal velocity,
%    vertical velocity, and pressure.
%
  for node = 1 : node_num

    x = node_xy(1,node);
    y = node_xy(2,node);
%
%  Here is where the (zero) Neumann condition on U and V applies.
%
    if ( x == 1.0 & ( 0.75 <= y & y <= 1.0 ) )

      u_bc(node) = 0.0;
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;
%
%  At other nodes, there is no Neumann condition.
%
    else

      u_bc(node) = 0.0;
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;

    end

  end

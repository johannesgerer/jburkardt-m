fucntion [ u_bc, v_bc, p_bc ] = neumann_condition ( node_num, node_xy )

%*****************************************************************************80
%
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
%    For the channel flow, we intend for the Dirichlet boundary conditions 
%    to be applied on the inflow and horizontal walls, and zero Neumann
%    conditions on the outflow.
%
%    The pressure is specified to be zero at a single node, but we let
%    the main program take care of that specification.
%
%                           DIRICHLET
%                           U_BC = V_BC = 0
%                           no slip wall
%
%                       1 +---------------+
%                          
%    Inflow -->                           --->  Outflow
%    DIRICHLET                                  NEUMANN
%    U = Y*(1-Y)        0 +---------------+     dU/dn = dV/dn = 0
%    V = 0
%                         0               3
%
%                           no slip wall
%                           DIRICHLET
%                           U_BC = V_BC = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2012
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
  u_bc = zeros ( node_num, 1 );
  v_bc = zeros ( node_num, 1 );
  p_bc = zeros ( node_num, 1 );

  for node = 1 : node_num

    x = node_xy(1,node);
    y = node_xy(2,node);
%
%  Outflow.
%
    if ( x == 3.0 )

      u_bc(node) = 0.0;
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;
%
%  No other Neumann conditions are imposed.
%  We simply set these array values to zero.
%
    else

      u_bc(node) = 0.0;
      v_bc(node) = 0.0;
      p_bc(node) = 0.0;

    end

  end

  return
end

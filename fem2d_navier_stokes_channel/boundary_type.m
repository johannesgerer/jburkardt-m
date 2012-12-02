function [ node_u_condition, node_v_condition, node_p_condition ] = ...
  boundary_type ( node_num, node_xy, node_boundary, node_type, ...
  node_u_condition, node_v_condition, node_p_condition )

%*******************************************************************************
%
%% BOUNDARY_TYPE determines the type of boundary conditions imposed.
%
%  Discussion:
%
%    On input, the calling program has already determined the "type"
%    of every node (vertex or midside), and whether or not it lies
%    on the boundary.
%
%    The program has also set up an initial guess for the boundary
%    conditions, by setting every boundary node to have Dirichlet
%    conditions for U and V, and by setting a single vertex boundary
%    node to have Dirichlet boundary conditions for P.
%
%    The user is free to adjust these boundary conditions in any
%    reasonable way.  
%
%    The most obvious adjustment is to change some velocity boundary
%    conditions to Neumann conditions.  Keep in mind that, for the moment, 
%    we are only supporting zero Neumann conditions.
%
%    However, it is also possible to constrain ANY variable, whether it
%    is on the boundary or not, or to UNCONSTRAIN any variable that
%    has been tentatively constrained.  You simply have to "warn" the code,
%    by setting U_TYPE, V_TYPE or P_TYPE appropriately, and by supplying
%    a value for the right hand side if you are doing a Dirichlet condition.
%
%
%    For the channel flow, we intend for the Dirichlet boundary conditions 
%    to be applied on the inflow and horizontal walls, and zero Neumann
%    conditions on the outflow.
%
%    The calling program has already found the boundary, and guessed that
%    all boundary velocities are constrained by Dirichlet conditions.  So
%    we only have to switch the velocity variables on the outflow to
%    Neumann type.
%
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
%    Input, integer NODE_NUM, the number of nodes
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, logical NODE_BOUNDARY(NODE_NUM), is TRUE if the node is
%    found to lie on the boundary of the region.
%
%    Input, integer NODE_TYPE(NODE_NUM), determines if the node is a 
%    vertex or midside node.
%    1, the node is a vertex (P, U, V variables are associated with it).
%    2, the node is a midside node (only U and V variables are associated.)
%
%    Input/output, integer NODE_U_CONDITION(NODE_NUM), 
%    indicates the condition used to determine horizontal velocity at a node.
%    0, there is no condition (and no variable) at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used. 
%    3, a Neumann condition is used. 
%
%    Input/output, integer NODE_V_CONDITION(NODE_NUM), 
%    indicates the condition used to determine vertical velocity at a node.
%    0, there is no condition (and no variable) at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.  
%
%    Input/output, integer NODE_P_CONDITION(NODE_NUM), 
%    indicates the condition used to determine pressure at a node.
%    0, there is no condition (and no variable) at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used. 
%    3, a Neumann condition is used. 
%
  for node = 1 : node_num

    x = node_xy(1,node);
    y = node_xy(2,node);
%
%  Reset the boundary condition to Neumann type for velocities
%  at nodes on the outflow.  However, leave the velocities at the
%  very top ( Y = 1 ) and bottom ( Y = 0 ) as Dirichlet.
%
    if ( x == 3.0 && 0.0 < y && y < 1.0 )

      node_u_condition(node) = 3;
      node_v_condition(node) = 3;

    end

  end

  return
end

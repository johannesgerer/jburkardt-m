function [ node_u_condition, node_v_condition, node_p_condition ] = ...
  boundary_type ( node_num, node_xy, node_boundary, node_type, ...
  node_u_condition, node_v_condition, node_p_condition )

%*****************************************************************************80
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
%    For the cavity flow, we intend for the Dirichlet boundary conditions
%    to be applied for velocity at all boundary points.
%
%    The calling program has already found the boundary, and guessed that
%    all boundary velocities are constrained by Dirichlet conditions.  So
%    this routine has nothing to do%
%
%
%    The pressure is specified to be zero at a single node, but we let
%    the main program take care of that specification.
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
%    08 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes
%
%    Input, real ( kind = 8 ) NODE_XY(2,NODE_NUM), the coordinates of the nodes.
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
  return
end

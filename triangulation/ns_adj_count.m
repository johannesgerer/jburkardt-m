function adj_num = ns_adj_count ( node_num, triangle_num, ...
  variable_num, triangle_node, triangle_neighbor, node_u_variable, ...
  node_v_variable, node_p_variable )

%*****************************************************************************80
%
%% NS_ADJ_COUNT counts adjacencies in a Navier Stokes triangulation.
%
%  Discussion:
%
%    This routine is called to count the adjacencies, so that the
%    appropriate amount of memory can be set aside for storage when
%    the adjacency structure is created.
%
%    The value of ADJ_NUM computed and returned by this routine should
%    be identical to the value computed by NS_ADJ_COL_SET.
%
%    The triangulation is assumed to involve 6-node triangles.
%
%    Variables for the horizontal and vertical velocities are associated
%    with every node.  Variables for the pressure are associated only with
%    the vertex nodes.
%
%    We are interested in determining the number of nonzero entries in the
%    stiffness matrix of the Stokes equations, or the jacobian matrix of
%    the Navier Stokes equations.  To this end, we will say, somewhat
%    too broadly, that two variables are "adjacent" if their associated 
%    nodes both occur in some common element.  This adjacency of variables
%    I and J is taken to be equivalent to the possible nonzeroness of
%    matrix entries A(I,J) and A(J,I).
%
%    A sparse compressed column format is used to store the counts for
%    the nonzeroes.  In other words, while the value ADJ_NUM reports the
%    number of adjacencies, the vector ADJ_COL is sufficient to allow us
%    to properly set up a sparse compressed matrix for the actual storage
%    of the sparse matrix, if we desire to proceed.
%
%  Local Node Numbering:
%
%       3
%    s  |\
%    i  | \
%    d  |  \
%    e  6   5  side 2
%       |    \
%    3  |     \
%       |      \
%       1---4---2
%
%         side 1
%
%  Variable Diagram:
%
%      UVP
%       |\
%       | \
%       |  \
%      UV   UV
%       |    \
%       |     \
%       |      \
%      UVP--UV--UVP
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer VARIABLE_NUM, the number of variables.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), lists the nodes that
%    make up each triangle.  The first three nodes are the vertices,
%    in counterclockwise order.  The fourth value is the midside
%    node between nodes 1 and 2; the fifth and sixth values are
%    the other midside nodes in the logical order.
%
%    Input, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), for each side of
%    a triangle, lists the neighboring triangle, or -1 if there is
%    no neighbor.
%
%    Input, integer NODE_U_VARIABLE(NODE_NUM), NODE_V_VARIABLE(NODE_NUM),
%    NODE_P_VARIABLE(NODE_NUM), the index of the horizontal velocity, 
%    vertical velocity and pressure variables associated with a node,
%    or -1 if no such variable is associated with the node.
%
%    Output, integer ADJ_NUM, the number of Navier Stokes variable adjacencies.
%
  triangle_order = 6;

  adj_num = 0;
%
%  Set every variable to be adjacent to itself.
%
  adj_num = variable_num;
%
%  Set every variable to be adjacent to the other variables associated with
%  that node. 
%
%  U <=> V
%  U <=> P (if there is a P variable)
%  V <=> P (if there is a P variable)
%
  for node = 1 : node_num

    adj_num = adj_num + 2;

    p1 = node_p_variable(node);

    if ( 0 < p1 )
      adj_num = adj_num + 4;
    end

  end
%
%  Examine each triangle.
%
  for triangle = 1 : triangle_num
%
%  For sure, we add the new adjacencies:
%
%    U5 V5 <=> U1 V1 P1
%    U6 V6 <=> U2 V2 P2
%    U4 V4 <=> U3 V3 P3
%    U5 V5 <=> U4 V4
%    U6 V6 <=> U4 V4
%    U6 V6 <=> U5 V5
%
    adj_num = adj_num + 60;
%
%  Add edges (1,2), (1,4), (2,4) if this is the first occurrence,
%  that is, if the edge (1,4,2) is on a boundary (TRIANGLE2 <= 0)
%  or if this triangle is the first of the pair in which the edge
%  occurs (TRIANGLE < TRIANGLE2).
%
%  Maybe add
%
%    U1 V1 P1 <=> U2 V2 P2
%    U1 V1 P1 <=> U4 V4
%    U2 V2 P2 <=> U4 V4
%
    triangle2 = triangle_neighbor(1,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_num = adj_num + 42;
    end
%
%  Maybe add
%
%    U2 V2 P2 <=> U3 V3 P3
%    U2 V2 P2 <=> U5 V5
%    U3 V3 P3 <=> U5 V5
%
    triangle2 = triangle_neighbor(2,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_num = adj_num + 42;
    end
%
%  Maybe add
%
%    U1 V1 P1 <=> U3 V3 P3
%    U1 V1 P1 <=> U6 V6
%    U3 V3 P3 <=> U6 V6
%
    triangle2 = triangle_neighbor(3,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_num = adj_num + 42;
    end
      
  end

  return
end

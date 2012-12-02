function adj_row = ns_adj_row_set ( node_num, triangle_num, variable_num, ...
  triangle_node, triangle_neighbor, node_u_variable, node_v_variable, ...
  node_p_variable, adj_num, adj_col )

%*****************************************************************************80
%
%% NS_ADJ_ROW_SET sets the Navier Stokes sparse compressed column row indices.
%
%  Discussion:
%
%    After NS_ADJ_COUNT has been called to count ADJ_NUM, the number of
%    variable adjacencies and to set up ADJ_COL, the compressed column pointer,
%    this routine can be called to assign values to ADJ_ROW, the row
%    indices of the sparse compressed column adjacency matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2006
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
%    Input, integer ADJ_NUM, the number of Navier Stokes variable adjacencies.
%
%    Input, integer ADJ_COL(VARIABLE_NUM+1).  Information about variable J
%    is stored in entries ADJ_COL(J) through ADJ_COL(J+1)-1 of ADJ.
%
%    Output, integer ADJ_ROW(ADJ_NUM), the row indices of the Navier Stokes
%    variable adjacency matrix.
%
%  Local Parameters:
%
%    Local, integer ADJ_COL_FREE(VARIABLE_NUM), for each column,
%    the location in ADJ_ROW which can store the next row index.
%
  triangle_order = 6;

  adj_row(1:adj_num) = -1;

  adj_col_free(1:variable_num) = adj_col(1:variable_num);
%
%  Set every variable to be adjacent to itself.
%
  for v = 1 : variable_num
    [ adj_col_free, adj_row ] = ns_adj_insert ( v, v, variable_num, ...
      adj_num, adj_col_free, adj_row );
  end
%
%  Set every variable to be adjacent to the other variables associated with
%  that node.
%
%  U <=> V
%  U <=> P (if there is a P variable)
%  V <=> P (if there is a P variable)
%
  for node = 1 : node_num

    u1 = node_u_variable(node);
    v1 = node_v_variable(node);
    p1 = node_p_variable(node);

    [ adj_col_free, adj_row ] = ns_adj_insert ( u1, v1, variable_num, ...
      adj_num, adj_col_free, adj_row );

    if ( 0 < p1 )

      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, p1, variable_num, ...
        adj_num, adj_col_free, adj_row );

      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, p1, variable_num, ...
        adj_num, adj_col_free, adj_row );

    end

  end
%
%  Examine each triangle.
%
  for triangle = 1 : triangle_num

    n1 = triangle_node(1,triangle);
    n2 = triangle_node(2,triangle);
    n3 = triangle_node(3,triangle);
    n4 = triangle_node(4,triangle);
    n5 = triangle_node(5,triangle);
    n6 = triangle_node(6,triangle);

    u1 = node_u_variable(n1);
    v1 = node_v_variable(n1);
    p1 = node_p_variable(n1);

    u2 = node_u_variable(n2);
    v2 = node_v_variable(n2);
    p2 = node_p_variable(n2);

    u3 = node_u_variable(n3);
    v3 = node_v_variable(n3);
    p3 = node_p_variable(n3);

    u4 = node_u_variable(n4);
    v4 = node_v_variable(n4);

    u5 = node_u_variable(n5);
    v5 = node_v_variable(n5);

    u6 = node_u_variable(n6);
    v6 = node_v_variable(n6);
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
    [ adj_col_free, adj_row ] = ns_adj_insert ( u5, u1, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u5, v1, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u5, p1, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v5, u1, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v5, v1, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v5, p1, variable_num, ...
      adj_num, adj_col_free, adj_row );

    [ adj_col_free, adj_row ] = ns_adj_insert ( u6, u2, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u6, v2, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u6, p2, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v6, u2, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v6, v2, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v6, p2, variable_num, ...
      adj_num, adj_col_free, adj_row );

    [ adj_col_free, adj_row ] = ns_adj_insert ( u4, u3, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u4, v3, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u4, p3, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v4, u3, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v4, v3, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v4, p3, variable_num, ...
      adj_num, adj_col_free, adj_row );

    [ adj_col_free, adj_row ] = ns_adj_insert ( u5, u4, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u5, v4, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v5, u4, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v5, v4, variable_num, ...
      adj_num, adj_col_free, adj_row );

    [ adj_col_free, adj_row ] = ns_adj_insert ( u6, u4, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u6, v4, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v6, u4, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v6, v4, variable_num, ...
      adj_num, adj_col_free, adj_row );

    [ adj_col_free, adj_row ] = ns_adj_insert ( u6, u5, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( u6, v5, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v6, u5, variable_num, ...
      adj_num, adj_col_free, adj_row );
    [ adj_col_free, adj_row ] = ns_adj_insert ( v6, v5, variable_num, ...
      adj_num, adj_col_free, adj_row );
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

      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, u2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, v2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, p2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, u2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, v2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, p2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, u2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, v2, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, p2, variable_num, ...
        adj_num, adj_col_free, adj_row );

      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, u4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, v4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, u4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, v4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, u4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, v4, variable_num, ...
        adj_num, adj_col_free, adj_row );

      [ adj_col_free, adj_row ] = ns_adj_insert ( u2, u4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u2, v4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v2, u4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v2, v4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p2, u4, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p2, v4, variable_num, ...
        adj_num, adj_col_free, adj_row );

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

      [ adj_col_free, adj_row ] = ns_adj_insert ( u2, u3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u2, v3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u2, p3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v2, u3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v2, v3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v2, p3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p2, u3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p2, v3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p2, p3, variable_num, ...
        adj_num, adj_col_free, adj_row );

      [ adj_col_free, adj_row ] = ns_adj_insert ( u2, u5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u2, v5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v2, u5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v2, v5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p2, u5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p2, v5, variable_num, ...
        adj_num, adj_col_free, adj_row );

      [ adj_col_free, adj_row ] = ns_adj_insert ( u3, u5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u3, v5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v3, u5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v3, v5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p3, u5, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p3, v5, variable_num, ...
        adj_num, adj_col_free, adj_row );

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

      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, u3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, v3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, p3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, u3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, v3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, p3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, u3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, v3, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, p3, variable_num, ...
        adj_num, adj_col_free, adj_row );

      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, u6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u1, v6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, u6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v1, v6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, u6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p1, v6, variable_num, ...
        adj_num, adj_col_free, adj_row );

      [ adj_col_free, adj_row ] = ns_adj_insert ( u3, u6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( u3, v6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v3, u6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( v3, v6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p3, u6, variable_num, ...
        adj_num, adj_col_free, adj_row );
      [ adj_col_free, adj_row ] = ns_adj_insert ( p3, v6, variable_num, ...
        adj_num, adj_col_free, adj_row );

    end

  end
%
%  Ascending sort the entries for each variable.
%
  for v = 1 : variable_num
    k1 = adj_col(v);
    k2 = adj_col(v+1)-1;
    adj_row(k1:k2) = i4vec_sort_heap_a ( k2+1-k1, adj_row(k1:k2) );
  end

  return
end


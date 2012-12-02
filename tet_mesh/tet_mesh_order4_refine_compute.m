function [ node_xyz2, tetra_node2 ] = tet_mesh_order4_refine_compute ( ...
  node_num1, tetra_num1, node_xyz1, tetra_node1, node_num2, tetra_num2, ...
  edge_data )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_REFINE_COMPUTE computes a refined order4 tet mesh.
%
%  Discussion:
%
%    A refined 4-node tet mesh can be derived from a given
%    4-node tet mesh by interpolating nodes at the midpoint of
%    every edge of the mesh.
%
%    The mesh is described indirectly, as the sum of individual
%    tetrahedrons.  A single physical edge may be a logical edge of
%    any number of tetrahedrons.  It is important, however, that a
%    new node be created exactly once for each edge, assigned an index,
%    and associated with every tetrahedron that shares this edge.
%
%    This routine handles that problem.
%
%    The primary amount of work occurs in sorting a list of 6 * TETRA_NUM
%    data items, one item for every edge of every tetrahedron.  Each
%    data item records, for a given tetrahedron edge, the global indices
%    of the two endpoints, the local indices of the two endpoints,
%    and the index of the tetrahedron.
%
%    Through careful sorting, it is possible to arrange this data in
%    a way that allows the proper generation of the interpolated nodes.
%
%    Let us add the new nodes and temporarily assign them local indices
%    5 through X, based on the following ordering:
%
%      1, 2, 3, 4, (1+2), (1+3), (1+4), (2+3), (2+4), (3+4).
%
%    Then let us assign these nodes to eight subtetrahedrons as follows:
%
%      1, 5, 6, 7
%      2, 5, 8, 9
%      3, 6, 8, 9
%      4, 7, 9, X
%      5, 6, 7, 9
%      5, 6, 8, 9
%      6, 7, 9, X
%      6, 8, 9, X
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anwei Liu, Barry Joe,
%    Quality Local Refinement of Tetrahedral Meshes Based
%    on 8-Subtetrahedron Subdivision,
%    Mathematics of Computation,
%    Volume 65, Number 215, July 1996, pages 1183-1200.
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes in the input mesh.
%
%    Input, integer TETRA_NUM1, the number of tetrahedrons in the
%    input mesh.
%
%    Input, real NODE_XYZ1(3,NODE_NUM1), the coordinates of
%    the nodes that make up the input mesh.
%
%    Input, integer TETRA_NODE1(4,TETRA_NUM1), the indices of the nodes
%    in the input mesh.
%
%    Input, integer NODE_NUM2, the number of nodes for the refined mesh.
%
%    Input, integer TETRA_NUM2, the number of tetrahedrons in the
%    refined mesh.
%
%    Input, integer EDGE_DATA(5,6*TETRA_NUM), edge data.
%
%    Output, real NODE_XYZ2(3,NODE_NUM2), the coordinates of
%    the nodes that make up the output mesh.
%
%    Output, integer TETRA_NODE2(4,TETRA_NUM2), the indices of the nodes
%    in the output mesh.
%

%
%  Generate the index and coordinates of the new midside nodes,
%  and update the tetradehron-node data.
%
  node_xyz2(1:3,1:node_num1) = node_xyz1(1:3,1:node_num1);

  tetra_node2(1:4,1:tetra_num2) = -1;
%
%  The vertices of the input tetrahedron can be assigned now.
%
  for tetra1 = 1 : tetra_num1
    tetra_node2(1,(tetra1-1)*8+1) = tetra_node1(1,tetra1);
    tetra_node2(1,(tetra1-1)*8+2) = tetra_node1(2,tetra1);
    tetra_node2(1,(tetra1-1)*8+3) = tetra_node1(3,tetra1);
    tetra_node2(1,(tetra1-1)*8+4) = tetra_node1(4,tetra1);
  end

  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 6 * tetra_num1
%
%  Read the data defining the edge.
%
    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
%
%  If this edge is new, create the coordinates and index.
%
    if ( n1 ~= n1_old | n2 ~= n2_old )

      node = node + 1;

      if ( node_num2 < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TET_MESH_ORDER4_REFINE_COMPUTE - Fatal error!\n' );
        fprintf ( 1, '  Node index exceeds NODE_NUM2.\n' );
        error ( 'TET_MESH_ORDER4_REFINE_COMPUTE - Fatal error!' );
      end

      node_xyz2(1:3,node) = ( node_xyz2(1:3,n1) + node_xyz2(1:3,n2) ) / 2.0;

      n1_old = n1;
      n2_old = n2;

    end
%
%  Assign the node to the tetrahedron.
%
    v1 = edge_data(3,edge);
    v2 = edge_data(4,edge);
    tetra1 = edge_data(5,edge);
%
%  We know the two vertices that bracket this new node.
%  This tells us whether it is new node number 5, 6, 7, 8, 9 or 10.
%  This tells us which of the new subtetrahedrons it belongs to,
%  and what position it occupies.
%
    if ( v1 == 1 & v2 == 2 )

      tetra_node2(2,(tetra1-1)*8+1) = node;
      tetra_node2(2,(tetra1-1)*8+2) = node;
      tetra_node2(1,(tetra1-1)*8+5) = node;
      tetra_node2(1,(tetra1-1)*8+6) = node;

    elseif ( v1 == 1 & v2 == 3 )

      tetra_node2(3,(tetra1-1)*8+1) = node;
      tetra_node2(2,(tetra1-1)*8+3) = node;
      tetra_node2(2,(tetra1-1)*8+5) = node;
      tetra_node2(2,(tetra1-1)*8+6) = node;
      tetra_node2(1,(tetra1-1)*8+7) = node;
      tetra_node2(1,(tetra1-1)*8+8) = node;

    elseif ( v1 == 1 & v2 == 4 )

      tetra_node2(4,(tetra1-1)*8+1) = node;
      tetra_node2(2,(tetra1-1)*8+4) = node;
      tetra_node2(3,(tetra1-1)*8+5) = node;
      tetra_node2(2,(tetra1-1)*8+7) = node;

    elseif ( v1 == 2 & v2 == 3 )

      tetra_node2(3,(tetra1-1)*8+2) = node;
      tetra_node2(3,(tetra1-1)*8+3) = node;
      tetra_node2(3,(tetra1-1)*8+6) = node;
      tetra_node2(2,(tetra1-1)*8+8) = node;

    elseif ( v1 == 2 & v2 == 4 )

      tetra_node2(4,(tetra1-1)*8+2) = node;
      tetra_node2(4,(tetra1-1)*8+3) = node;
      tetra_node2(3,(tetra1-1)*8+4) = node;
      tetra_node2(4,(tetra1-1)*8+5) = node;
      tetra_node2(4,(tetra1-1)*8+6) = node;
      tetra_node2(3,(tetra1-1)*8+7) = node;
      tetra_node2(3,(tetra1-1)*8+8) = node;

    elseif ( v1 == 3 & v2 == 4 )

      tetra_node2(4,(tetra1-1)*8+4) = node;
      tetra_node2(4,(tetra1-1)*8+7) = node;
      tetra_node2(4,(tetra1-1)*8+8) = node;

    end

  end

  return
end

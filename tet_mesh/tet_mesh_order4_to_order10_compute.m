function [ tetra_node2, node_xyz2 ] = tet_mesh_order4_to_order10_compute ( ...
  tetra_num, tetra_node1, node_num1, node_xyz1, edge_data, node_num2 )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_TO_ORDER10_COMPUTE computes a quadratic tet mesh from a linear one.
%
%  Discussion:
%
%    A quadratic (10 node) tet mesh can be derived from a linear
%    (4 node) tet mesh by interpolating nodes at the midpoint of
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
%    The node ordering for the quadratic tetrahedron is somewhat
%    arbitrary.  In the current scheme, the vertices are listed
%    first, followed by the 6 midside nodes.  Each midside node
%    may be identified by the two vertices that bracket it.  Thus,
%    the node ordering may be suggested by:
%
%      1  2  3  4 (1+2) (1+3) (1+4) (2+3) (2+4) (3+4)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TETRA_NUM, the number of tetrahedrons in the
%    linear mesh.
%
%    Input, integer TETRA_NODE1(4,TETRA_NUM), the nodes that make up
%    each tetrahedron in the linear mesh.
%
%    Input, integer NODE_NUM1, the number of nodes for the linear mesh.
%
%    Input, real NODE_XYZ1(3,NODE_NUM1), the coordinates of
%    the nodes that make up the linear mesh.
%
%    Input, integer EDGE_DATA(5,6*TETRA_NUM), edge data.
%
%    Input, integer NODE_NUM2, the number of nodes for the quadratic mesh.
%
%    Output, integer TETRA_NODE2(10,TETRA_NUM), the nodes that make up
%    each tetrahedron in the quadratic mesh.
%
%    Output, real NODE_XYZ2(3,NODE_NUM2), the coordinates of
%    the nodes that make up the quadratic mesh.
%

%
%  Generate the index and coordinates of the new midside nodes,
%  and update the tetradehron-node data.
%
  node_xyz2(1:3,1:node_num1) = node_xyz1(1:3,1:node_num1);

  tetra_node2(1:4,1:tetra_num) = tetra_node1(1:4,1:tetra_num);

  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 6 * tetra_num
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
        fprintf ( 1, 'TET_MESH_ORDER4_TO_ORDER10_COMPUTE - Fatal error!\n' );
        fprintf ( 1, '  Node index exceeds NODE_NUM2.\n' );
        error ( 'TET_MESH_ORDER4_TO_ORDER10_COMPUTE - Fatal error!' );
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
%
%  Here is where the local ordering of the nodes is effected:
%
    if ( v1 == 1 & v2 == 2 )
      v = 5;
    elseif ( v1 == 1 & v2 == 3 )
      v = 6;
    elseif ( v1 == 1 & v2 == 4 )
      v = 7;
    elseif ( v1 == 2 & v2 == 3 )
      v = 8;
    elseif ( v1 == 2 & v2 == 4 )
      v = 9;
    elseif ( v1 == 3 & v2 == 4 )
      v = 10;
    end

    tetra = edge_data(5,edge);

    tetra_node2(v,tetra) = node;

  end

  return
end


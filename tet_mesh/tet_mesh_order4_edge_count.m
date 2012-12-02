function edge_num = tet_mesh_order4_edge_count ( tetra_num, tetra_node )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_EDGE_COUNT counts the number of edges.
%
%  Discussion:
%
%    This routine is given a tet mesh, an abstract list of
%    quadruples of nodes.  Each tetrahedron defines 6 edges; however,
%    assuming that tetrahedrons are touching each other, most edges
%    will be used more than once.  This routine determines the actual
%    number of "geometric" edges associated with the tet mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(4,TETRA_NUM), the nodes that make up the
%    tetrahedrons.
%
%    Output, integer EDGE_NUM, the number of edges.
%
  m = 3;
  edge_num_raw = 6 * tetra_num;
%
%  Set up the raw edge array:
%
  edge(1,            1:  tetra_num) = tetra_node(1,1:tetra_num);
  edge(2,            1:  tetra_num) = tetra_node(2,1:tetra_num);

  edge(1,  tetra_num+1:2*tetra_num) = tetra_node(1,1:tetra_num);
  edge(2,  tetra_num+1:2*tetra_num) = tetra_node(3,1:tetra_num);

  edge(1,2*tetra_num+1:3*tetra_num) = tetra_node(1,1:tetra_num);
  edge(2,2*tetra_num+1:3*tetra_num) = tetra_node(4,1:tetra_num);

  edge(1,3*tetra_num+1:4*tetra_num) = tetra_node(2,1:tetra_num);
  edge(2,3*tetra_num+1:4*tetra_num) = tetra_node(3,1:tetra_num);

  edge(1,4*tetra_num+1:5*tetra_num) = tetra_node(2,1:tetra_num);
  edge(2,4*tetra_num+1:5*tetra_num) = tetra_node(4,1:tetra_num);

  edge(1,5*tetra_num+1:6*tetra_num) = tetra_node(3,1:tetra_num);
  edge(2,5*tetra_num+1:6*tetra_num) = tetra_node(4,1:tetra_num);
%
%  Force the nodes of each face to be listed in ascending order.
%
  edge = i4col_sort2 ( m, edge_num_raw, edge );
%
%  Ascending sort the columns.
%
  edge = i4col_sort_a ( m, edge_num_raw, edge );
%
%  Get the number of unique columns.
%
  edge_num = i4col_sorted_unique_count ( m, edge_num_raw, edge );

  return
end

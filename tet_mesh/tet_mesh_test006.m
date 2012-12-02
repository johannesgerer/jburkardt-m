function tet_mesh_test006 ( )

%*****************************************************************************80
%
%% TET_MESH_TEST006 tests TET_MESH_TET_NEIGHBORS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 August 2009
%
%  Author:
%
%    John Burkardt
%
  tet_order = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_TEST006\n' );
  fprintf ( 1, '  TET_MESH_TET_NEIGHBORS computes the 4 neighboring\n' );
  fprintf ( 1, '  tetrahedrons of each tetrahedron in a tet mesh.\n' );
  fprintf ( 1, '  containing a point.\n' );
%
%  Set up the example tetrahedron mesh.
%
  [ node_num, tet_num ] = tet_mesh_order4_example_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This mesh has tetrahedron order %d\n', tet_order );
  fprintf ( 1, '  The number of tetrahedrons is   %d\n', tet_num );

  [ node_xyz, tet_node ] = tet_mesh_order4_example_set ( node_num, tet_num );
%
%  Print the tets.
%
  i4mat_transpose_print_some ( tet_order, tet_num, tet_node, ...
    1, 1, tet_order, 10, '  First 10 Tets:' );
%
%  The TET_NEIGHBOR array is needed by TET_MESH_DELAUNAY_SEARCH.
%
  tet_neighbor = tet_mesh_neighbor_tets ( tet_order, tet_num, tet_node );

  i4mat_transpose_print_some ( 4, tet_num, tet_neighbor, ...
    1, 1, 4, 10, '  First 10 Tet Neighbors:' );

  return
end
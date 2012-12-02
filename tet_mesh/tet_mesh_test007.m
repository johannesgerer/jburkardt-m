function test007 ( )

%*****************************************************************************80
%
%% TEST007 tests TET_MESH_SEARCH_NAIVE and TET_MESH_SEARCH_DELAUNAY.
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
  test_num = 5;
  tet_order = 4;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST007\n' );
  fprintf ( 1, '  TET_MESH_SEARCH_NAIVE uses a naive algorithm\n' );
  fprintf ( 1, '  to search a tetrahedral mesh for the tetrahedron\n' );
  fprintf ( 1, '  containing a point.\n' );
  fprintf ( 1, '  TET_MESH_SEARCH_DELAUNAY uses a faster algorithm\n' );
  fprintf ( 1, '  which is appropriate if the tet mesh is Delaunay.\n' );
%
%  Set up the example tetrahedron mesh.
%
  [ node_num, tet_num ] = tet_mesh_order4_example_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This mesh has tetrahedron order %d\n', tet_order );
  fprintf ( 1, '  The number of tetrahedrons is   %d\n', tet_num );

  [ node_xyz, tet_node ] = tet_mesh_order4_example_set ( node_num, tet_num );
%
%  TET_NEIGHBOR is needed for the Delaunay search.
%
  tet_neighbor = tet_mesh_neighbor_tets ( tet_order, tet_num, tet_node );

  for test = 1 : test_num
%
%  Choose a tetrahedral index at random.
%
    [ tet1, seed ] = i4_uniform ( 1, tet_num, seed );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Point was chosen from tetrahedron    %8d\n', tet1 );
%
%  Choose a point at random from the tetrahedron.
%
    [ p, seed ] = tetrahedron_sample ( node_xyz(1:3,tet_node(1:4,tet1)), 1, seed );
%
%  Naive search.
%
    [ tet2, step_num ] = tet_mesh_search_naive ( node_num, node_xyz, ...
      tet_order, tet_num, tet_node, p );

    fprintf ( 1, '  Naive search ended in tetrahedron    %8d after %d steps\n', ...
      tet2, step_num );
%
%  Delaunay search.
% 
    [ tet3, face, step_num ] = tet_mesh_search_delaunay ( node_num, ...
      node_xyz, tet_order, tet_num, tet_node, tet_neighbor, p );

    fprintf ( 1, ...
      '  Delaunay search ended in tetrahedron %8d after %d steps.\n', ...
      tet3, step_num );

  end

  return
end

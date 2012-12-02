function geometry_test082 ()

%*****************************************************************************80
%
%% TEST082 tests POLYHEDRON_CENTROID_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
  maxorder = 3;
  face_num = 4;
  dim_num = 3;
  node_num = 4;

  centroid_exact = [ 0.25, 0.25, 0.25 ];
  coord = [ ...
    0.0, 0.0, 0.0; ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0 ]';
  node = [ ...
    3, 1, 1, 2; ...
    2, 2, 4, 3; ...
    1, 4, 3, 4 ]';
  order = [ 3, 3, 3, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST082\n' );
  fprintf ( 1, '  For a polyhedron in 3D:\n' );
  fprintf ( 1, '  POLYHEDRON_CENTROID_3D computes the centroid;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of faces is %d\n', face_num );

  i4vec_print ( face_num, order, '  Order of each face:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes per face:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : face_num
    fprintf ( 1, '  %4d  ', i );
    for j = 1 : order(i)
      fprintf ( 1, '  %4d', node(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  r8mat_transpose_print ( dim_num, node_num, coord, '  Polyhedron nodes:' );

  centroid = polyhedron_centroid_3d ( coord, maxorder, face_num, node, node_num, ...
    order );

  r8vec_print ( dim_num, centroid, '  Computed centroid:' );
  r8vec_print ( dim_num, centroid_exact, '  Exact centroid:' );

  return
end

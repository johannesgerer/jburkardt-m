function geometry_test203 ( )

%*****************************************************************************80
%
%% TEST203 tests TETRAHEDRON_CENTROID_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  tetra = [ ...
     0.000000,  0.942809, -0.333333; ...
    -0.816496, -0.816496, -0.333333; ...
     0.816496, -0.816496, -0.333333; ...
     0.000000,  0.000000,  1.000000 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST203\n' );
  fprintf ( 1, '  For a tetrahedron in 3D,\n' );
  fprintf ( 1, '  TETRAHEDRON_CENTROID_3D computes the centroid;\n' );

  r8mat_transpose_print ( dim_num, 4, tetra, '  Tetrahedron vertices:' );

  centroid = tetrahedron_centroid_3d ( tetra );

  r8vec_print ( dim_num, centroid, '  Centroid:' );

  return
end

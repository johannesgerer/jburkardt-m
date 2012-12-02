function geometry_test20321 ( )

%*****************************************************************************80
%
%% TEST20321 tests TETRAHEDRON_EDGE_LENGTH_3D;
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
     0.577350269189626,  0.0, 0.0; ...
    -0.288675134594813,  0.5, 0.0; ...
    -0.288675134594813, -0.5, 0.0; ...
     0.0,                0.0, 0.816496580927726 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20321\n' );
  fprintf ( 1, '  For a tetrahedron in 3D,\n' );
  fprintf ( 1, '  TETRAHEDRON_EDGE_LENGTH_3D computes the edge lengths;\n' );

  r8mat_transpose_print ( dim_num, 4, tetra, '  Tetrahedron vertices:' );

  edge_length = tetrahedron_edge_length_3d ( tetra );

  r8vec_print ( 6, edge_length, '  Edge lengths:' );

  return
end

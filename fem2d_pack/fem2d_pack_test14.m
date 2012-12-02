function fem2d_pack_test14 ( )

%*****************************************************************************80
%
%% TEST14 demonstrates MASS_MATRIX_T6.
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
  element_num = 2;
  node_num = 9;

  node = [ 1, 3, 7, 2, 5, 4;
           9, 7, 3, 8, 5, 6 ]';
  x = [ 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 1.0, 1.0, 1.0 ];
  y = [ 0.0, 0.5, 1.0, 0.0, 0.5, 1.0, 0.0, 0.5, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  MASS_MATRIX_T6 computes the mass matrix for\n' );
  fprintf ( 1, '  a finite element system using T6 elements\n' );
  fprintf ( 1, '  (quadratic triangles).\n' );

  a = mass_matrix_t6 ( node_num, element_num, node, x, y );

  r8mat_print ( node_num, node_num, a, '  The T6 mass matrix:' );

  return
end

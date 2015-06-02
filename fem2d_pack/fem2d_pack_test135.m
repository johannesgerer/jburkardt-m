function fem2d_pack_test135 ( )

%*****************************************************************************80
%
%% TEST135 demonstrates MASS_MATRIX_T3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2013
%
%  Author:
%
%    John Burkardt
%
  element_num = 8;
  node_num = 9;

  node = [ ...
    1, 4, 2; ...
    5, 2, 4; ...
    4, 7, 5; ...
    8, 5, 7; ...
    2, 5, 3; ...
    6, 3, 5; ...
    5, 8, 6; ...
    9, 6, 8 ]';
  x = [ 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 1.0, 1.0, 1.0 ];
  y = [ 0.0, 0.5, 1.0, 0.0, 0.5, 1.0, 0.0, 0.5, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST135\n' );
  fprintf ( 1, '  MASS_MATRIX_T3 computes the mass matrix for\n' );
  fprintf ( 1, '  a finite element system using T3 elements\n' );
  fprintf ( 1, '  (linear triangles).\n' );

  a = mass_matrix_t3 ( node_num, element_num, node, x, y );

  r8mat_print ( node_num, node_num, a, '  The T3 mass matrix:' );

  return
end

function triangulation_test265 ( )

%*****************************************************************************80
%
%% TEST265 tests TRIANGULATION_ORDER6_REFINE_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  node_num1 = 12;
  triangle_num1 = 3;
  triangle_order = 6;

  node_xy1 = [ ...
       0.0, 0.0; ...
       2.0, 0.0; ...
       0.0, 2.0; ...
       2.0, 2.0; ...
       1.0, 3.0; ...
       1.0, 0.0; ...
       0.0, 1.0; ...
       1.0, 1.0; ...
       2.0, 1.0; ...
       1.0, 2.0; ...
       0.5, 2.5; ...
       1.5, 2.5 ]';
  triangle_node1 = [ ...
       1,  2,  3,  6,  8,  7; ...
       4,  3,  2,  9, 10,  8; ...
       3,  4,  5, 10, 12, 11 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST265\n' );
  fprintf ( 1, '  For an order6 triangulation:\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_REFINE_SIZE determines the\n' );
  fprintf ( 1, '  size of a refined triangulation.\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_REFINE_COMPUTES computes the\n' );
  fprintf ( 1, '  refined triangulation.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of nodes is %d\n', node_num1 );
  fprintf ( 1, '  The number of triangles is %d\n', triangle_num1 );

  r8mat_transpose_print ( dim_num, node_num1, node_xy1, ...
    '  The nodes' );

  i4mat_transpose_print ( triangle_order, triangle_num1, triangle_node1, ...
    '  The triangles:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sizing the refined mesh:\n' );

  [ node_num2, triangle_num2, edge_data ] = ...
    triangulation_order6_refine_size ( node_num1, triangle_num1, ...
    triangle_node1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Information about the refined mesh:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of nodes is %d\n', node_num2 );
  fprintf ( 1, '  The number of triangles is %d\n', triangle_num2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computing the refined mesh:\n' );

  [ node_xy2, triangle_node2 ] = triangulation_order6_refine_compute ( ...
    node_num1, triangle_num1, node_xy1, triangle_node1, node_num2, ...
    triangle_num2, edge_data );

  r8mat_transpose_print ( dim_num, node_num2, node_xy2, ...
    '  The refined nodes' );

  i4mat_transpose_print ( triangle_order, triangle_num2, triangle_node2, ...
    '  The refined triangles:' );

  edge_data = [];
  node_xy2 = [];
  triangle_node2 = [];

  return
end

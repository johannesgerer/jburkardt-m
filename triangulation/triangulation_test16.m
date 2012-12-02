function triangulation_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests TRIANGULATION_ORDER3_CHECK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
  triangle_num = 16;
  node_num = 13;

  triangle_node(1:3,1:triangle_num) = [ ...
     3,   4,   1; ...
     3,   1,   2; ...
     3,   2,   8; ...
     2,   1,   5; ...
     8,   2,  13; ...
     8,  13,   9; ...
     3,   8,   9; ...
    13,   2,   5; ...
     9,  13,   7; ...
     7,  13,   5; ...
     6,   7,   5; ...
     9,   7,   6; ...
    10,   9,   6; ...
     6,   5,  12; ...
    11,   6,  12; ...
    10,   6,  11 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  For a triangulation of a set of nodes,\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_CHECK checks the triangulation.\n' );

  i4mat_transpose_print ( 3, triangle_num, triangle_node, '  Triangles:' );
%
%  Pass all tests.
%
  ierror = triangulation_order3_check ( node_num, triangle_num, triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );
%
%  Fail test 1.
%
  node_num2 = 2;

  ierror = triangulation_order3_check ( node_num2, triangle_num, ...
    triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );
%
%  Fail test 2.
%
  triangle_num2 = 0;

  ierror = triangulation_order3_check ( node_num, triangle_num2, ...
    triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );
%
%  Fail test 3.
%
  isave = triangle_node(2,5);
  triangle_node(2,5) = 0;

  ierror = triangulation_order3_check ( node_num, triangle_num, triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );
  triangle_node(2,5) = isave;
%
%  Fail test 4.
%
  isave = triangle_node(3,10);
  triangle_node(3,10) = 2 * node_num + 1;

  ierror = triangulation_order3_check ( node_num, triangle_num, triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );
  triangle_node(3,10) = isave;
%
%  Fail test 5.
%
  triangle_node(3,4) = 3;
  triangle_node(3,8) = 3;
  triangle_node(3,10) = 3;
  triangle_node(3,11) = 3;
  triangle_node(2,14) = 3;

  ierror = triangulation_order3_check ( node_num, triangle_num, triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );

  triangle_node(3,4) = 5;
  triangle_node(3,8) = 5;
  triangle_node(3,10) = 5;
  triangle_node(3,11) = 5;
  triangle_node(2,14) = 5;
%
%  Fail test 6.
%
  triangle_node(1,9) = 7;
  ierror = triangulation_order3_check ( node_num, triangle_num, triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );
  triangle_node(1,9) = 9;
%
%  Fail test 7.
%
  triangle_node(3,7) = 2;
  ierror = triangulation_order3_check ( node_num, triangle_num, triangle_node );

  fprintf ( 1, '  Error code = %d\n', ierror );
  triangle_node(3,7) = 9;

  return
end

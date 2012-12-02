function triangulation_test025 ( )

%*****************************************************************************80
%
%% TEST025 tests DELAUNAY_SWAP_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2009
%
%  Author:
%
%    John Burkardt
%
  node_num = 4;
  triangle_num = 2;
  triangle_order = 3;
  seed = 123456789;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST025\n' );
  fprintf ( 1, '  DELAUNAY_SWAP_TEST determines whether two triangles\n' );
  fprintf ( 1, '  with a common edge need to "swap" diagonals.\n' );
  fprintf ( 1, '  If swapping is indicated, then ALPHA_MIN should increase.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Swap   ALPHA_MIN   ALPHA_MIN\n' );
  fprintf ( 1, '         Unswapped   Swapped\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
%
%  Generate a random quadrilateral (1,2,3,4).
%
    [ node_xy, seed ] = quad_convex_random ( seed );
%
%  Does it need swapping?
%
    swap = delaunay_swap_test ( node_xy );
%
%  Compute ALPHA_MIN unswapped.
%
    triangle_node(1:3,1) = [ 1, 2, 3 ]';
    triangle_node(1:3,2) = [ 1, 3, 4 ]';

    [ alpha_min_unswapped, alpha_ave, alpha_area ] = alpha_measure ( ...
      node_num, node_xy, triangle_order, triangle_num, triangle_node );
%
%  Compute ALPHA_MIN swapped.
%
    triangle_node(1:3,1) = [ 1, 2, 4 ]';
    triangle_node(1:3,2) = [ 2, 3, 4 ]';

    [ alpha_min_swapped, alpha_ave, alpha_area ] = alpha_measure ( ...
      node_num, node_xy, triangle_order, triangle_num, triangle_node );

    if ( 0 )
      r8mat_transpose_print ( 2, node_num, node_xy, '  Quadrilateral' );
    end

    fprintf ( 1, '     %1d  %10f  %10f\n', ...
      swap, alpha_min_unswapped, alpha_min_swapped );

  end

  return
end

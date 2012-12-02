function triangulation_test219 ( )

%*****************************************************************************80
%
%% TEST219 tests TRIANGULATION_SEARCH_DELAUNAY and TRIANGULATION_SEARCH_NAIVE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  node_num = 13;
  test_num = 10;
  triangle_order = 3;

  node_xy(1:dim_num,1:node_num) = [ ...
       0.0, 0.0; ...
       2.0, 2.0; ...
      -1.0, 3.0; ...
      -2.0, 2.0; ...
       8.0, 2.0; ...
       9.0, 5.0; ...
       7.0, 4.0; ...
       5.0, 6.0; ...
       6.0, 7.0; ...
       8.0, 8.0; ...
      11.0, 7.0; ...
      10.0, 4.0; ...
       6.0, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST219\n' );
  fprintf ( 1, '  Given a triangulation, and a point P,\n' );
  fprintf ( 1, '  find the triangle T containing to P.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  TRIANGULATION_SEARCH_NAIVE uses a naive method.\n' );
  fprintf ( 1, '  TRIANGULATION_SEARCH_DELAUNAY uses a method that will work\n' );
  fprintf ( 1, '  fast if the triangulation is Delaunay..\n' );
%
%  Set up the Delaunay triangulation.
%
  [ triangle_num, triangle_node, triangle_neighbor ] = r8tris2 ( node_num, ...
    node_xy );
%
%  Get the test points.
%
  seed = 123456789;

  [ seed, p_test, t_test ] = triangulation_order3_sample ( node_num, ...
    node_xy, triangle_num, triangle_node, test_num, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      X        Y         Naive   Delaunay    Steps\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    triangle_index1 = triangulation_search_naive ( node_num, node_xy, ...
      triangle_order, triangle_num, triangle_node, p_test(1:dim_num,test) );

    [ triangle_index2, alpha, beta, gamma, edge, step_num ] = ...
      triangulation_search_delaunay ( node_num, node_xy, triangle_order, ...
      triangle_num, triangle_node, triangle_neighbor, p_test(1:dim_num,test) );

    fprintf ( 1, '  %8.4f  %8.4f  %8d  %8d  %8d\n', ...
      p_test(1:dim_num,test), triangle_index1, triangle_index2, step_num );

  end

  return
end

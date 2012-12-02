function triangulation_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests Q_MEASURE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  Q_MEASURE returns the Q measure of\n' );
  fprintf ( 1, '  quality of a triangulation.\n' );
%
%  Get the sizes.
%
  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order3_example1_size ( );
%
%  Get the example data.
%
  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order3_example1 ( node_num, triangle_num );
%
%  Compute the triangulation quality.
%
  triangle_order = 3;
  
  [ q_min, q_max, q_ave, q_area ] = q_measure ( node_num, node_xy, ...
    triangle_order, triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q_MIN  = %f\n', q_min );
  fprintf ( 1, '  Q_MAX  = %f\n', q_max );
  fprintf ( 1, '  Q_AVE  = %f\n', q_ave );
  fprintf ( 1, '  Q_AREA = %f\n', q_area );

  return
end

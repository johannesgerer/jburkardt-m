function triangulation_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests AREA_MEASURE.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  AREA_MEASURE returns the area ratio measure of\n' );
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
  
  [ area_min, area_max, area_ratio, area_ave, area_std ] = area_measure ( ...
    node_num, node_xy, triangle_order, triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  AREA_MIN   = %f\n', area_min );
  fprintf ( 1, '  AREA_MAX   = %f\n', area_max );
  fprintf ( 1, '  AREA_RATIO = %f\n', area_ratio );
  fprintf ( 1, '  AREA_AVE   = %f\n', area_ave );
  fprintf ( 1, '  AREA_STD   = %f\n', area_std );

  return
end

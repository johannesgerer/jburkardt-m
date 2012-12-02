function triangulation_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests ALPHA_MEASURE.
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  ALPHA_MEASURE returns the ALPHA measure of\n' );
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
  
  [ alpha_min, alpha_ave, alpha_area ] = alpha_measure ( node_num, node_xy, ...
    triangle_order, triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ALPHA_MIN  = %f\n', alpha_min );
  fprintf ( 1, '  ALPHA_AVE  = %f\n', alpha_ave );
  fprintf ( 1, '  ALPHA_AREA = %f\n', alpha_area );

  return
end

function dunavant_test06 ( )

%*****************************************************************************80
%
%% DUNAVANT_TEST06 demonstrates REFERENCE_TO_PHYSICAL_T3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2006
%
%  Author:
%
%    John Burkardt
%
  node_num = 3;

  node_xy = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    0.0, 1.0 ]';
  node_xy2 = [ ...
    1.0, 2.0; ...
    1.0, 1.0; ...
    3.0, 2.0 ]';
  point_show = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DUNAVANT_TEST06\n' );
  fprintf ( 1, '  REFERENCE_TO_PHYSICAL_T3 transforms a rule\n' );
  fprintf ( 1, '  on the unit (reference) triangle to a rule on\n' );
  fprintf ( 1, '  an arbitrary (physical) triangle.\n' );

  rule = 2;

  order_num = dunavant_order_num ( rule );

  [ xy, w ] = dunavant_rule ( rule, order_num );
%
%  Here is the reference triangle, and its rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The reference triangle:\n', rule );
  fprintf ( 1, '\n' );

  for node = 1 : 3
    fprintf ( 1, '  %8d  %14f  %14f\n', node, node_xy(1:2,node) );
  end

  area = triangle_area ( node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule %d for reference triangle\n', rule );
  fprintf ( 1, '  with area = %f\n', area );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                X               Y               W\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f\n', order, xy(1:2,order), w(order) );
  end
%
%  Transform the rule.
%
  xy2 = reference_to_physical_t3 ( node_xy2, order_num, xy );
%
%  Here is the physical triangle, and its transformed rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The physical triangle:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : 3
    fprintf ( 1, '  %8d  %14f  %14f\n', node, node_xy2(1:2,node) );
  end

  area2 = triangle_area ( node_xy2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule %d for physical triangle', rule );
  fprintf ( 1, '  with area = %f\n', area2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                X               Y               W\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f\n', order, xy2(1:2,order), w(order) );
  end

  return
end

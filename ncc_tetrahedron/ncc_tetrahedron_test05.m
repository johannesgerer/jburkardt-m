function ncc_tetrahedron_test05 ( )

%*****************************************************************************80
%
%% TEST05 demonstrates REFERENCE_TO_PHYSICAL_T4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  node_num = 4;

  node_xyz = [ ...
    0.0, 0.0, 0.0; ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0;
    0.0, 0.0, 1.0 ]';
  node_xyz2 = [ ...
    4.0, 5.0, 1.0; ...
    6.0, 5.0, 1.0; ...
    4.0, 8.0, 1.0; ...
    4.0, 5.0, 5.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  REFERENCE_TO_PHYSICAL_T4 transforms a rule\n' );
  fprintf ( 1, '  on the unit (reference) tetrahedron to a rule on\n' );
  fprintf ( 1, '  an arbitrary (physical) tetrahedron.\n' );

  rule = 3;

  order_num = ncc_tetrahedron_order_num ( rule );

  [ xyz, w ] = ncc_tetrahedron_rule ( rule, order_num );
%
%  Here is the reference tetrahedron, and its rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The reference tetrahedron:\n', rule );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f\n', node, node_xyz(1:dim_num,node) );
  end

  volume = tetrahedron_volume ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule %d for reference tetrahedron\n', rule );
  fprintf ( 1, '  with volume = %f\n', volume );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                X               Y               Z              W\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f  %14f\n', ...
      order, xyz(1:dim_num,order), w(order) );
  end
%
%  Transform the rule.
%
  xyz2 = reference_to_physical_t4 ( node_xyz2, order_num, xyz );
%
%  Here is the physical tetrahedron, and its transformed rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The physical tetrahedron:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f\n', node, node_xyz2(1:dim_num,node) );
  end

  volume2 = tetrahedron_volume ( node_xyz2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule %d for physical tetrahedron', rule );
  fprintf ( 1, '  with volume = %f\n', volume2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                X               Y               Z             W\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f  %14f\n', ...
      order, xyz2(1:dim_num,order), w(order) );
  end

  return
end

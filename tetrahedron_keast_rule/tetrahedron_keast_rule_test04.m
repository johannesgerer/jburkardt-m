function tetrahedron_keast_rule_test04 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_KEAST_RULE_TEST04 demonstrates TETRAHEDRON_REFERENCE_TO_PHYSICAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 December 2006
%
%  Author:
%
%    John Burkardt
%
  node_num = 4;

  node_xyz = [ ...
    0.0, 0.0, 0.0; ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0 ]';
  node_xyz2 = [ ...
    1.0, 2.0, 3.0; ...
    2.0, 2.0, 3.0; ...
    1.0, 3.0, 3.0; ...
    1.0, 2.0, 9.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_KEAST_RULE_TEST04\n' );
  fprintf ( 1, '  TETRAHEDRON_REFERENCE_TO_PHYSICAL transforms a rule\n' );
  fprintf ( 1, '  on the unit (reference) tetrahedron to a rule on\n' );
  fprintf ( 1, '  an arbitrary (physical) tetrahedron.\n' );

  rule = 2;

  order_num = keast_order_num ( rule );

  [ xyz, w ] = keast_rule ( rule, order_num );
%
%  Here is the reference tetrahedron, and its rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The reference tetrahedron:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f\n', node, node_xyz(1:3,node) )
  end

  volume = tetrahedron_volume ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule %d for reference tetrahedron\n', rule );
  fprintf ( 1, '  with volume = %f\n', volume );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '                X               Y               Z              W\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f  %14f\n', ...
      order, xyz(1:3,order), w(order) );
  end
%
%  Transform the rule.
%
  xyz2 = tetrahedron_reference_to_physical ( node_xyz2, order_num, xyz );
%
%  Here is the physical tetrahedron, and its transformed rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The physical tetrahedron:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f\n', node, node_xyz2(1:3,node) )
  end

  volume2 = tetrahedron_volume ( node_xyz2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule %d for physical tetrahedron\n', rule );
  fprintf ( 1, '  with volume = %f\n', volume2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '                X               Y               Z              W\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_num
    fprintf ( 1, '  %8d  %14f  %14f  %14f  %14f\n', ...
      order, xyz(1:3,order), w(order) );
  end

  return
end

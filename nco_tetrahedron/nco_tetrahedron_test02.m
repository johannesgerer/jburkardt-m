function nco_tetrahedron_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests NCO_TETRAHEDRON_RULE.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  NCO_TETRAHEDRON_RULE returns the points and weights\n' );
  fprintf ( 1, '  of an NCO rule for the tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that the weights\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = nco_tetrahedron_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Sum of weights\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    order_num = nco_tetrahedron_order_num ( rule );

    [ xy, w ] = nco_tetrahedron_rule ( rule, order_num );

    w_sum = sum ( w(1:order_num) );

    fprintf ( 1, '  %8d  %14f\n', rule, w_sum );
    
  end

  return
end

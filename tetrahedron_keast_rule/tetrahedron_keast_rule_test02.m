function tetrahedron_keast_rule_test02 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_KEAST_RULE_TEST02 tests KEAST_RULE.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_KEAST_RULE_TEST02\n' );
  fprintf ( 1, '  KEAST_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Keast rule for the tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that the weights\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = keast_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule     Sum of weights\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    order_num = keast_order_num ( rule );

    [ xyztab, wtab ] = keast_rule ( rule, order_num );

    wtab_sum = sum ( wtab(1:order_num) );

    fprintf ( 1, '  %8d  %25e\n', rule, wtab_sum );

  end

  return
end

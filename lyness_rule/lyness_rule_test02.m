function lyness_rule_test02 ( )

%*****************************************************************************80
%
%% LYNESS_RULE_TEST02 performs the weight sum test on Lyness rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LYNESS_RULE_TEST02\n' );
  fprintf ( 1, '  LYNESS_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Lyness rule for the triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that the weights\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = lyness_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Sum of weights\n' );
  fprintf ( 1, '\n' );

  for rule = 0 : rule_num

    order = lyness_order ( rule );

    [ w, x ] = lyness_rule ( rule, order );

    w_sum = sum ( w(1:order) );

    fprintf ( 1, '  %8d  %25.16f\n', rule, w_sum );

  end

  return
end

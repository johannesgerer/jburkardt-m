function dunavant_test02 ( )

%*****************************************************************************80
%
%% DUNAVANT_TEST02 tests DUNAVANT_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DUNAVANT_TEST02\n' );
  fprintf ( 1, '  DUNAVANT_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Dunavant rule for the triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that the weights\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = dunavant_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Order    Sum of weights\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    order_num = dunavant_order_num ( rule );

    [ xy, w ] = dunavant_rule ( rule, order_num );

    w_sum = sum ( w(1:order_num) );

    fprintf ( 1, '  %8d  %8d  %14f\n', rule, order_num, w_sum );
    
  end

  return
end

function triangle_fekete_rule_test02 ( )

%*****************************************************************************80
%
%% TRIANGLE_FEKETE_RULE_TEST02 tests FEKETE_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_FEKETE_RULE_TEST02\n' );
  fprintf ( 1, '  FEKETE_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Fekete rule for the triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that the weights\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = fekete_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Sum of weights\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    order_num = fekete_order_num ( rule );

    [ xy, w ] = fekete_rule ( rule, order_num );

    w_sum = sum ( w(1:order_num) );

    fprintf ( 1, '  %8d  %14f\n', rule, w_sum );
    
  end

  return
end

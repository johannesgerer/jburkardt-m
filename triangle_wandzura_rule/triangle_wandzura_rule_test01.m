function triangle_wandzura_rule_test01 ( )

%*****************************************************************************80
%
%% TRIANGLE_WANDZURA_RULE_TEST01 tests WANDZURA_RULE_NUM, WANDZURA_DEGREE, WANDZURA_ORDER_NUM.
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
  fprintf ( 1, 'TRIANGLE_WANDZURA_RULE_TEST01\n' );
  fprintf ( 1, '  WANDZURA_RULE_NUM returns the number of rules;\n' );
  fprintf ( 1, '  WANDZURA_DEGREE returns the degree of a rule;\n' );
  fprintf ( 1, '  WANDZURA_ORDER_NUM returns the order of a rule.\n' );

  rule_num = wandzura_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Degree     Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num
    order_num = wandzura_order_num ( rule );
    degree = wandzura_degree ( rule );
    fprintf ( 1, '  %8d  %8d  %8d\n', rule, degree, order_num );
  end

  return
end

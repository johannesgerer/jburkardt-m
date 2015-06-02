function triangle_fekete_rule_test01 ( )

%*****************************************************************************80
%
%% TRIANGLE_FEKETE_RULE_TEST01 tests FEKETE_RULE_NUM, FEKETE_DEGREE, FEKETE_ORDER_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_FEKETE_RULE_TEST01\n' );
  fprintf ( 1, '  FEKETE_RULE_NUM returns the number of rules;\n' );
  fprintf ( 1, '  FEKETE_DEGREE returns the degree of a rule;\n' );
  fprintf ( 1, '  FEKETE_ORDER_NUM returns the order of a rule.\n' );

  rule_num = fekete_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Degree     Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num
    order_num = fekete_order_num ( rule );
    degree = fekete_degree ( rule );
    fprintf ( 1, '  %8d  %8d  %8d\n', rule, degree, order_num );
  end

  return
end

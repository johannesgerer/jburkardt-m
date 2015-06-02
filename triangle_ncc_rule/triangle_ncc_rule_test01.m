function triangle_ncc_rule_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests TRIANGLE_NCC_RULE_NUM, TRIANGLE_NCC_DEGREE, TRIANGLE_NCC_ORDER_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  TRIANGLE_NCC_RULE_NUM returns the number of rules;\n' );
  fprintf ( 1, '  TRIANGLE_NCC_DEGREE returns the degree of a rule;\n' );
  fprintf ( 1, '  TRIANGLE_NCC_ORDER_NUM returns the order of a rule.\n' );

  rule_num = triangle_ncc_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Degree     Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num
    order_num = triangle_ncc_order_num ( rule );
    degree = triangle_ncc_degree ( rule );
    fprintf ( 1, '  %8d  %8d  %8d\n', rule, degree, order_num );
  end

  return
end

function dunavant_test01 ( )

%*****************************************************************************80
%
%% DUNAVANT_TEST01 tests DUNAVANT_RULE_NUM, DUNAVANT_DEGREE, DUNAVANT_ORDER_NUM.
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
  fprintf ( 1, 'DUNAVANT_TEST01\n' );
  fprintf ( 1, '  DUNAVANT_RULE_NUM returns the number of rules;\n' );
  fprintf ( 1, '  DUNAVANT_DEGREE returns the degree of a rule;\n' );
  fprintf ( 1, '  DUNAVANT_ORDER_NUM returns the order of a rule.\n' );

  rule_num = dunavant_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Degree     Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num
    order_num = dunavant_order_num ( rule );
    degree = dunavant_degree ( rule );
    fprintf ( 1, '  %8d  %8d  %8d\n', rule, degree, order_num );
  end

  return
end

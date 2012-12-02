function keast_test01 ( )

%*****************************************************************************80
%
%% KEAST_TEST01 tests KEAST_RULE_NUM, KEAST_DEGREE, KEAST_ORDER_NUM.
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
  fprintf ( 1, 'KEAST_TEST01\n' );
  fprintf ( 1, '  KEAST_RULE_NUM returns the number of rules;\n' );
  fprintf ( 1, '  KEAST_DEGREE returns the degree of a rule;\n' );
  fprintf ( 1, '  KEAST_ORDER_NUM returns the order of a rule.\n' );

  rule_num = keast_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule      Degree     Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num
    order_num = keast_order_num ( rule );
    degree = keast_degree ( rule );
    fprintf ( 1, '  %8d  %8d  %8d\n', rule, degree, order_num );
  end

  return
end

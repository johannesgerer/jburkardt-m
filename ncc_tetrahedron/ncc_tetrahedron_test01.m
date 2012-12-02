function ncc_tetrahedron_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests NCC_TETRAHEDRON_RULE_NUM, NCC_TETRAHEDRON_DEGREE, NCC_TETRAHEDRON_ORDER_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  NCC_TETRAHEDRON_RULE_NUM returns the number of rules;\n' );
  fprintf ( 1, '  NCC_TETRAHEDRON_DEGREE returns the degree of a rule;\n' );
  fprintf ( 1, '  NCC_TETRAHEDRON_ORDER_NUM returns the order of a rule.\n' );

  rule_num = ncc_tetrahedron_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Degree     Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num
    order_num = ncc_tetrahedron_order_num ( rule );
    degree = ncc_tetrahedron_degree ( rule );
    fprintf ( 1, '  %8d  %8d  %8d\n', rule, degree, order_num );
  end

  return
end

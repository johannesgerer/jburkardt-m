function nco_tetrahedron_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests NCO_TETRAHEDRON_RULE_NUM, NCO_TETRAHEDRON_DEGREE, NCO_TETRAHEDRON_ORDER_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  NCO_TETRAHEDRON_RULE_NUM returns the number of rules;\n' );
  fprintf ( 1, '  NCO_TETRAHEDRON_DEGREE returns the degree of a rule;\n' );
  fprintf ( 1, '  NCO_TETRAHEDRON_ORDER_NUM returns the order of a rule.\n' );

  rule_num = nco_tetrahedron_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Degree     Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num
    order_num = nco_tetrahedron_order_num ( rule );
    degree = nco_tetrahedron_degree ( rule );
    fprintf ( 1, '  %8d  %8d  %8d\n', rule, degree, order_num );
  end

  return
end

function ncc_triangle_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests NCC_TRIANGLE_RULE.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  NCC_TRIANGLE_RULE returns the points and weights\n' );
  fprintf ( 1, '  of an NCC rule for the triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that the weights\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = ncc_triangle_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of available rules = %d\n', rule_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule    Sum of weights\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    order_num = ncc_triangle_order_num ( rule );

    [ xy, w ] = ncc_triangle_rule ( rule, order_num );

    w_sum = sum ( w(1:order_num) );

    fprintf ( 1, '  %8d  %14f\n', rule, w_sum );
    
  end

  return
end

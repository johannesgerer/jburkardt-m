function triangle_lyness_rule_test03 ( )

%*****************************************************************************80
%
%% TRIANGLE_LYNESS_RULE_TEST03 performs the barycentric coordinate sum test on Lyness rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_LYNESS_RULE_TEST03\n' );
  fprintf ( 1, '  LYNESS_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Lyness rule for the triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that, for each\n' );
  fprintf ( 1, '  quadrature point, the barycentric coordinates\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = lyness_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule   Suborder    Sum of coordinates\n' );

  for rule = 0 : rule_num

    suborder_num = lyness_suborder_num ( rule );

    [ sub_xyz, sub_w ] = lyness_subrule ( rule, suborder_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d  %8d\n', rule, suborder_num );
    for suborder = 1 : suborder_num
      xyz_sum = sum ( sub_xyz(1:3,suborder) );
      fprintf ( 1, '                      %25.16f\n', xyz_sum );
    end

  end

  return
end

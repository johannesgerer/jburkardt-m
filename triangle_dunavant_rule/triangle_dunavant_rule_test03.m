function triangle_dunavant_rule_test03 ( )

%*****************************************************************************80
%
%% TRIANGLE_DUNAVANT_RULE_TEST03 tests DUNAVANT_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_DUNAVANT_RULE_TEST03\n' );
  fprintf ( 1, '  DUNAVANT_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Dunavant rule for the triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that, for each\n' );
  fprintf ( 1, '  quadrature point, the barycentric coordinates\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = dunavant_rule_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule   Suborder    Sum of coordinates\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    suborder_num = dunavant_suborder_num ( rule );

    [ suborder_xyz, suborder_w ] = dunavant_subrule ( rule, suborder_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d  %8d\n', rule, suborder_num );
    for suborder = 1 : suborder_num
      xyz_sum = sum ( suborder_xyz(1:3,suborder) );
      fprintf ( 1, '                      %25e\n', xyz_sum );
    end
    
  end

  return
end

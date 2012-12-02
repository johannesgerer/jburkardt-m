function nco_tetrahedron_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests NCO_TETRAHEDRON_RULE.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  NCO_TETRAHEDRON_RULE returns the points and weights\n' );
  fprintf ( 1, '  of an NCO rule for the tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that, for each\n' );
  fprintf ( 1, '  quadrature point, the barycentric coordinates\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = nco_tetrahedron_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule   Suborder    Sum of coordinates\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    suborder_num = nco_tetrahedron_suborder_num ( rule );

    [ suborder_xyz, suborder_w ] = nco_tetrahedron_subrule ( rule, suborder_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d  %8d\n', rule, suborder_num );
    for suborder = 1 : suborder_num
      xyz_sum = sum ( suborder_xyz(1:4,suborder) );
      fprintf ( 1, '                      %25e\n', xyz_sum );
    end
    
  end

  return
end

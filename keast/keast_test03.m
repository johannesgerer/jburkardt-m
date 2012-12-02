function keast_test03 ( )

%*****************************************************************************80
%
%% KEAST_TEST03 tests KEAST_RULE.
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
  fprintf ( 1, 'KEAST_TEST03\n' );
  fprintf ( 1, '  KEAST_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Keast rule for the tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply check that, for each\n' );
  fprintf ( 1, '  quadrature point, the barycentric coordinates\n' );
  fprintf ( 1, '  sum to 1.\n' );

  rule_num = keast_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule   Suborder    Sum of coordinates\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    suborder_num = keast_suborder_num ( rule );

    [ suborder_xyzz, suborder_w ] = keast_subrule ( rule, suborder_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d  %8d\n', rule, suborder_num );
    for suborder = 1 : suborder_num
      xyzz_sum = sum ( suborder_xyzz(1:4,suborder) );
      fprintf ( 1, '                      %25e\n', xyzz_sum );
    end

  end

  return
end

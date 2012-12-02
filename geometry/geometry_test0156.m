function geometry_test0156 ( )

%*****************************************************************************80
%
%% TEST0156 tests CIRCLE_EXP2IMP_2D and CIRCLE_IMP2EXP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0156\n' );
  fprintf ( 1, '  CIRCLE_EXP2IMP_2D converts an explicit circle\n' );
  fprintf ( 1, '    to an implicit circle.\n' );
  fprintf ( 1, '  CIRCLE_IMP2EXP_2D converts an implicit circle\n' );
  fprintf ( 1, '    to an explicit circle.\n' );

  pc1(1,1) = 10.0;
  pc1(2,1) =  5.0;
  r1 = 3.0;

  circle_imp_print_2d ( r1, pc1, '  The implicit circle:' );

  [ p1, p2, p3 ] = circle_imp2exp_2d ( r1, pc1 );

  r8vec_print ( 2, p1, '  P1:' );
  r8vec_print ( 2, p2, '  P2:' );
  r8vec_print ( 2, p3, '  P3:' );

  [ r2, pc2 ] = circle_exp2imp_2d ( p1, p2, p3 );

  circle_imp_print_2d ( r2, pc2, '  The recovered implicit circle:' );

  return
end

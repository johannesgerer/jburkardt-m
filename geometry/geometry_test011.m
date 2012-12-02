function geometry_test011 ( )

%*****************************************************************************80
%
%% TEST011 tests CIRCLE_DIA2IMP_2D.
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
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST011\n' );
  fprintf ( 1, '  CIRCLE_DIA2IMP_2D converts a diameter to an\n' );
  fprintf ( 1, '  implicit circle in 2D.\n' );

  theta = 2.0;

  p1(1,1) = 2.0 + 5.0 * cos ( theta );
  p1(2,1) = 3.0 + 5.0 * sin ( theta );

  p2(1,1) = 2.0 - 5.0 * cos ( theta );
  p2(2,1) = 3.0 - 5.0 * sin ( theta );

  r8vec_print ( dim_num, p1, '  P1:' )
  r8vec_print ( dim_num, p2, '  P2:' )

  [ r, center ] = circle_dia2imp_2d ( p1, p2 );

  circle_imp_print_2d ( r, center, '  The implicit circle:' );

  return
end

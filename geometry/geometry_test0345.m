function geometry_test0345 ( )

%*****************************************************************************80
%
%% TEST0345 tests LINE_EXP2IMP_2D, LINE_IMP2EXP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  ntest = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0345\n' );
  fprintf ( 1, '  LINE_EXP2IMP_2D converts explicit to implicit lines.\n' );
  fprintf ( 1, '  LINE_IMP2EXP_2D converts implicit to explicit lines.\n' );

  a = 1.0;
  b = 2.0;
  c = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Implicit line A, B, C = %f  %f  %f\n', a, b, c );

  [ p1, p2 ] = line_imp2exp_2d ( a, b, c );

  r8vec_print ( dim_num, p1, '  The point P1:' );
  r8vec_print ( dim_num, p2, '  The point P2:' );

  [ a, b, c ] = line_exp2imp_2d ( p1, p2 );

  fprintf ( 1, '  Recovered A, B, C =  %f  %f  %f\n', a, b, c );

  return
end

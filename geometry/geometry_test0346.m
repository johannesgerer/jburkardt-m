function geometry_test0346 ( )

%*****************************************************************************80
%
%% TEST0346 tests LINE_EXP2PAR_2D, LINE_PAR2EXP_2D.
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
  fprintf ( 1, 'TEST0346\n' );
  fprintf ( 1, '  LINE_EXP2PAR_2D converts explicit to parametric lines.\n' );
  fprintf ( 1, '  LINE_PAR2EXP_2D converts parametric to explicit lines.\n' );

  f = 1.0;
  g = 2.0;
  x0 = 3.0;
  y0 = 4.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Parametric line:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    F,  G =  %8f  %8f\n', f, g );
  fprintf ( 1, '    X0, Y0 = %8f  %8f\n', x0, y0 );

  [ p1, p2 ] = line_par2exp_2d ( f, g, x0, y0 );

  r8vec_print ( dim_num, p1, '  The point P1:' );
  r8vec_print ( dim_num, p2, '  The point P2:' );

  [ f, g, x0, y0 ] = line_exp2par_2d ( p1, p2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Recovered parametric line:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    F,  G =  %8f  %8f\n', f, g );
  fprintf ( 1, '    X0, Y0 = %8f  %8f\n', x0, y0 );

  return
end

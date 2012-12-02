function geometry_test0416 ( )

%*****************************************************************************80
%
%% TEST0416 tests LINES_PAR_INT_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1,  'TEST0416\n' );
  fprintf ( 1, '  LINES_PAR_INT_2D finds the intersection of\n' );
  fprintf ( 1, '  two lines written in parametric form.\n' );
  fprintf ( 1, '\n' );
%
%  x - 2y = -1
%
  x1 =  0.0;
  y1 =  1.0;
  f1 =  2.0;
  g1 =  1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line 1 parameters:  %8f  %8f  %8f  %8f\n', x1, y1, f1, g1 );
%
%  x + y - 8 = 0
%
  x2 = 10.0;
  y2 = -2.0;
  f2 =  1.0;
  g2 =  1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line 2 parameters:  %8f  %8f  %8f  %8f\n', x2, y2, f2, g2 );

  [ t1, t2, pint ] = lines_par_int_2d ( f1, g1, x1, y1, f2, g2, x2, y2 );

  fprintf ( 1, '\n' );
  fprintf ( 1,  '  Line 1 evaluated at T1:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1,  '    T1 =   %8f\n', t1 );
  fprintf ( 1,  '    X(T1)= %8f\n', x1 + f1 * t1 );
  fprintf ( 1,  '    Y(T1)= %8f\n', y1 + g1 * t1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line 2 evaluated at T2:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    T2 =   %8f\n', t2 );
  fprintf ( 1, '    X(T2)= %8f\n', x2 + f2 * t2 );
  fprintf ( 1, '    Y(T2)= %8f\n', y2 + g2 * t2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported intersection:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    PINT(1) = %8f\n', pint(1) );
  fprintf ( 1, '    PINT(2) = %8f\n', pint(2) );

  return
end

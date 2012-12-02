function r8lib_test100 ( )

%*****************************************************************************80
%
%% TEST100 tests R8POLY2_VAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST100\n' );
  fprintf ( 1, '  R8POLY2_VAL evaluates a parabola given\n' );
  fprintf ( 1, '    3 data points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our parabola will be 2*x^2 + 3 * x + 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Case 1: 3 distinct data points:\n' );
  fprintf ( 1, '\n' );

  x1 = -1.0;
  x2 = 1.0;
  x3 = 3.0;

  [ y1, yp, ypp ] = r8lib_test100_f ( x1 );
  [ y2, yp, ypp ] = r8lib_test100_f ( x2 );
  [ y3, yp, ypp ] = r8lib_test100_f ( x3 );

  fprintf ( 1, '  %12f  %12f\n', x1, y1 );
  fprintf ( 1, '  %12f  %12f\n', x2, y2 );
  fprintf ( 1, '  %12f  %12f\n', x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sampled data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, Y, Y'', Y"\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 3
    x = i;
    [ y, yp, ypp ] = r8poly2_val ( x1, y1, x2, y2, x3, y3, x );
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', x, y, yp, ypp );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Case 2: X1=X2, X3 distinct:\n' );
  fprintf ( 1, '\n' );

  x1 = -1.0;
  x2 = -1.0;
  x3 = 3.0;

  [ y1, y2, ypp ] = r8lib_test100_f ( x1 );
  [ y3, yp, ypp ] = r8lib_test100_f ( x3 );
  fprintf ( 1, '  %12f  %12f\n', x1, y1 );
  fprintf ( 1, '  %12f  %12f\n', x2, y2 );
  fprintf ( 1, '  %12f  %12f\n', x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sampled data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, Y, Y'', Y"\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 3
    x = i;
    [ y, yp, ypp ] = r8poly2_val ( x1, y1, x2, y2, x3, y3, x );
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', x, y, yp, ypp );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Case 3: X1=X2=X3:\n' );
  fprintf ( 1, '\n' );

  x1 = -1.0;
  x2 = -1.0;
  x3 = -1.0;

  [ y1, y2, y3 ] = r8lib_test100_f ( x1 );

  fprintf ( 1, '  %12f  %12f\n', x1, y1 );
  fprintf ( 1, '  %12f  %12f\n', x2, y2 );
  fprintf ( 1, '  %12f  %12f\n', x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sampled data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, Y, Y'', Y"\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 3
    x = i;
    [ y, yp, ypp ] = r8poly2_val ( x1, y1, x2, y2, x3, y3, x );
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', x, y, yp, ypp );
  end

  return
end

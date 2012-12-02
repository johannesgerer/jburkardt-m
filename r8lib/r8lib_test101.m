function subpak_test101 ( )

%*****************************************************************************80
%
%% TEST101 tests R8POLY2_VAL2.
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
  ndata = 5;
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST101\n' );
  fprintf ( 1, '  R8POLY2_VAL2 evaluates parabolas through\n' );
  fprintf ( 1, '    3 points in a table\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our data tables will actually be parabolas:\n' );
  fprintf ( 1, '    A: 2*x^2 + 3 * x + 1.\n' );
  fprintf ( 1, '    B: 4*x^2 - 2 * x + 5.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ndata
    xval = 2.0 * i;
    xdata(i) = xval;
    ydata(1,i) = 2.0 * xval^2 + 3.0 * xval + 1.0;
    ydata(2,i) = 4.0 * xval^2 - 2.0 * xval + 5.0;
    fprintf ( 1, '  %6d  %12f  %12f  %12f\n', ...
      i, xdata(i), ydata(1,i), ydata(2,i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Interpolated data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEFT, X, Y1, Y2\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 4
    xval = 2 * i + 1;
    left = max ( min ( i + 1, ndata - 2 ), 1 );
    yval = r8poly2_val2 ( dim_num, ndata, xdata, ydata, left, xval );
    fprintf ( 1, '  %8d  %12f  %12f  %12f\n', left, xval, yval(1), yval(2) );
  end

  return
end

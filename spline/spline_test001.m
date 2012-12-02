function spline_test001 ( )

%*****************************************************************************80
%
%% TEST001 tests PARABOLA_VAL2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  ndim = 1;
  ndata = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  PARABOLA_VAL2 evaluates parabolas through\n' );
  fprintf ( 1, '    3 points in a table\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our data tables will actually be parabolas:\n' );
  fprintf ( 1, '    A: 2*x**2 + 3 * x + 1.\n' );
  fprintf ( 1, '    B: 4*x**2 - 2 * x + 5.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ndata

    xval = 2.0 * i;
    xdata(i) = xval;
    ydata(1,i) = 2.0 * xval * xval + 3.0 * xval + 1.0;
    zdata(i) = 4.0 * xval * xval - 2.0 * xval + 5.0;

    fprintf ( 1, '%6d  %10f  %10f  %10f\n', i, xdata(i), ydata(1,i), zdata(i) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Interpolated data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEFT, X, Y1, Y2\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5

    xval = 2 * i - 1;
    left = i;

    if ( ndata - 2 < left )
      left = ndata - 2;
    end

    if ( left < 1 )
      left = 1;
    end

    yval = parabola_val2 ( ndim, ndata, xdata, ydata, left, xval );

    zval = parabola_val2 ( ndim, ndata, xdata, zdata, left, xval );

    fprintf ( 1, '%6d  %10f  %10f  %10f\n', left, xval, yval(1), zval(1) );

  end

  return
end

function spline_test145 ( )

%*****************************************************************************80
%
%% TEST145 tests SPLINE_CONSTANT_VAL.
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
  ndata = 12;
  n_test = 20;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST145\n' );
  fprintf ( 1, '  SPLINE_CONSTANT_VAL evaluates a piecewise \n' );
  fprintf ( 1, '  constant spline.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Runge''s function, evenly spaced knots.\n' );
%
%  Set the data.
%
  tlo = -1.0E+00;
  thi = +1.0E+00;

  tdata = r8vec_even ( ndata-1, tlo, thi );

  for i = 1 : ndata

      if ( i == 1 )
      tval = tdata(1);
    elseif ( i < ndata )
      tval = 0.5E+00 * ( tdata(i-1) + tdata(i) );
    elseif ( i == ndata )
      tval = tdata(i-1);
    end

    ydata(i) = frunge ( tval );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', ndata );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ndata
    fprintf ( 1, '%c                  %14f\n', '*', ydata(i) );
    if ( i < ndata )
      fprintf ( 1, '%c  %14f\n', '*', tdata(i) );
    end
  end
%
%  Sample the spline.
%
  alo = tlo - 1.0E+00;
  ahi = thi + 1.0E+00;

  [ t_test, seed ] = r8vec_uniform ( n_test, alo, ahi, seed );

  t_test = r8vec_sort_bubble_a ( n_test, t_test );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     T     Y(interp)    Y(exact)\n' );
  fprintf ( 1, '\n' );

  j = 0;
  fprintf ( 1, '%c                  %14f\n', '*', ydata(j+1) );
  j = j + 1;

  for i = 1 : n_test

    tval = t_test(i);

    yval = spline_constant_val ( ndata, tdata, ydata, tval );

    if ( j <= ndata - 1 )
      while ( tdata(j) <= tval )
        fval = frunge ( tdata(j) );
        fprintf ( 1, '%c  %14f                  %14f\n', '*', tdata(j), fval );
        fprintf ( 1, '%c                  %14f\n', '*', ydata(j+1) );
        j = j + 1;
        if ( ndata <= j )
          break;
        end
      end
    end

    fval = frunge ( tval );

    fprintf ( 1, '%c  %14f  %14f  %14f\n', ' ', tval, yval, fval );

  end

  return
end

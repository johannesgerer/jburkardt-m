function spline_test21 ( )

%*****************************************************************************80
%
%% TEST21 tests SPLINE_LINEAR_VAL.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST21\n' );
  fprintf ( 1, '  SPLINE_LINEAR_VAL evaluates a linear spline.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Runge''s function, evenly spaced knots.\n' );

  t = linspace ( -1.0E+00, 1.0E+00, n )';
  y = frunge ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'T, Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( '%14f  %14f\n', t(i), y(i) );
  end

  for i = 0 : n

    if ( i == 0 )
      jhi = 1;
    elseif ( i < n )
      jhi = 2;
    else
      jhi = 2;
    end

    for j = 1 : jhi

      if ( i == 0 )
        tval = t(1) - 1.0E+00;
      elseif ( i < n )
        tval = ( ( jhi + 1 - j ) * t(i) + ( j - 1 ) * t(i+1) ) / jhi;
      else
        if ( j == 1 )
          tval = t(n);
        else
          tval = t(n) + 1.0E+00;
        end
      end

      [ yval, ypval ] = spline_linear_val ( n, t, y, tval );

      fval = frunge ( tval );

      fprintf ( 1, '\n' );
      fprintf ( 1, '%12f  %12f  %12f\n', tval, yval, fval );

    end

  end

  return
end

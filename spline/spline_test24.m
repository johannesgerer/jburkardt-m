function spline_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests SPLINE_QUADRATIC_VAL.
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
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  SPLINE_QUADRATIC_VAL evaluates a\n' );
  fprintf ( 1, '    quadratic spline.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Runge''s function, evenly spaced knots.\n' );

  for i = 1 : n

    t(i) = ( ( n - i     ) * ( -1.0 )   ...
           + (     i - 1 ) * ( +1.0 ) ) ...
           / ( n     - 1 );

    y(i) =  frunge ( t(i) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '%14f  %14f\n', t(i), y(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Interpolated values\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y           Y(exact)\n' );
  fprintf ( 1, '\n' );

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
        tval = t(1) - 1.0;
      elseif ( i < n )
        tval = ( ( jhi - j + 1 ) * t(i)     ...
               + (       j - 1 ) * t(i+1) ) ...
               / ( jhi         );
      else
        if ( j == 1 )
          tval = t(n);
        else
          tval = t(n) + 1.0;
        end
      end

      [ yval, ypval ] = spline_quadratic_val ( n, t, y, tval );

      fval = frunge ( tval );

      fprintf ( 1, '%14f  %14f  %14f\n', tval, yval, fval );

    end

  end

  return
end

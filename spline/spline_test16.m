function spline_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests SPLINE_CUBIC_SET, SPLINE_CUBIC_VAL2.
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
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  SPLINE_CUBIC_SET sets up a cubic spline;\n' );
  fprintf ( 1, '  SPLINE_CUBIC_VAL2 evaluates it.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Runge''s function, evenly spaced knots.\n' );

  for i = 1 : n

    t(i) = ( ( n - i     ) * (-1.0E+00)   ...
           + (     i - 1 ) * (+1.0E+00) ) ...
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
%
%  Try boundary condition types 0, 1 and 2.
%
  for k = 0 : 2

    if ( k == 0 )

      ibcbeg = 0;
      ybcbeg = 0.0E+00;

      ibcend = 0;
      ybcend = 0.0E+00;

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Boundary condition 0 at both ends:\n' );
      fprintf ( 1, '  Spline is quadratic in boundary intervals.\n' );

    elseif ( k == 1 )

      ibcbeg = 1;
      ybcbeg = fprunge ( t(1) );

      ibcend = 1;
      ybcend = fprunge ( t(n) );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Boundary condition 1 at both ends:\n' );
      fprintf ( 1, '  Y''(left) =  %f\n', ybcbeg );
      fprintf ( 1, '  Y''(right) = %f\n', ybcend );

    elseif ( k == 2 )

      ibcbeg = 2;
      ybcbeg = fpprunge ( t(1) );

      ibcend = 2;
      ybcend = fpprunge ( t(n) );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Boundary condition 2 at both ends:\n' );
      fprintf ( 1, '  YP"(left) =  %f\n', ybcbeg );
      fprintf ( 1, '  YP"(right) = %f\n', ybcend );

    end

    ypp = spline_cubic_set ( n, t, y, ibcbeg, ybcbeg, ibcend, ybcend );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  SPLINE"(T), F"(T):\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '%14f  %14f\n', ypp(i), fpprunge(t(i)) );
    end

    left = 0;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  T, SPLINE(T), F(T), LEFT_IN, LEFT_OUT\n' );
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
          tval = t(1) - 1.0E+00;
        elseif ( i < n )
          tval = ( ( jhi - j + 1 ) * t(i)     ...
                 + (       j - 1 ) * t(i+1) ) ...
                 / ( jhi         );
        else
          if ( j == 1 )
            tval = t(n);
          else
            tval = t(n) + 1.0E+00;
          end
        end

        left_in = left;

        [ yval, ypval, yppval ] = ...
          spline_cubic_val2 ( n, t, y, ypp, left, tval );

        fprintf ( 1, '%14f  %14f  %14f  %6d  %6d\n', ...
          tval, yval, frunge ( tval ), left_in, left );

      end
    end

  end

  return
end

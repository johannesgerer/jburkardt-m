function spline_test19 ( )

%*****************************************************************************80
%
%% TEST19 tests SPLINE_CUBIC_SET, SPLINE_CUBIC_VAL.
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
  n = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  SPLINE_CUBIC_SET sets up a cubic spline;\n' );
  fprintf ( 1, '  SPLINE_CUBIC_VAL evaluates it.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cubic data, evenly spaced knots.\n' );
  fprintf ( 1, '  ONLY TWO KNOTS!\n' );

  for i = 1 : n
    t(i) = ( i - 1 ) / ( n - 1 );
    y(i) =  fcube ( t(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', n);
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '%14f  %14f\n', t(i), y(i) );
  end
%
%  Try all 9 pairs of boundary condition types 0, 1 and 2.
%
  for k1 = 0 : 2

    if ( k1 == 0 )

      ibcbeg = 0;
      ybcbeg = 0.0E+00;

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Boundary condition 0 at left end.\n' );

    elseif ( k1 == 1 )

      ibcbeg = 1;
      ybcbeg = fpcube ( t(1) );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Boundary condition 1 at left end.\n' );
      fprintf ( 1, '  Y''(left) =  %f\n', ybcbeg );

    elseif ( k1 == 2 )

      ibcbeg = 2;
      ybcbeg = fppcube ( t(1) );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Boundary condition 2 at left ends:\n' );
      fprintf ( 1, '  YP"(left) =  %f\n', ybcbeg );

    end

    for k2 = 0 : 2

      if ( k2 == 0 )

        ibcend = 0;
        ybcend = 0.0E+00;

        fprintf ( 1, '\n' );
        fprintf ( 1, '  Boundary condition 0 at right end.\n' );

      elseif ( k2 == 1 )

        ibcend = 1;
        ybcend = fpcube ( t(n) );

        fprintf ( 1, '\n' );
        fprintf ( 1, '  Boundary condition 1 at right end.\n' );
        fprintf ( 1, '  Y''(right) = %f\n', ybcend );

      elseif ( k2 == 2 )

        ibcend = 2;
        ybcend = fppcube ( t(n) );

        fprintf ( 1, '\n' );
        fprintf ( 1, '  Boundary condition 2 at right end.\n' );
        fprintf ( 1, '  YP"(right) = %f\n', ybcend );

      end

      ypp = spline_cubic_set ( n, t, y, ibcbeg, ybcbeg, ibcend, ybcend );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  SPLINE"(T), F"(T): \n' );
      fprintf ( 1, '\n' );
      for i = 1 : n
        fprintf ( 1, '%14f  %14f\n', ypp(i), fppcube(t(i)) );
      end

      fprintf ( 1, '\n' );
      fprintf ( 1, '  T, SPLINE(T), F(T)\n' );
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

          [ yval, ypval, yppval ] = spline_cubic_val ( n, t, y, ypp, tval );

          fprintf ( 1, '%10f\n', tval );
          fprintf ( 1, '          %10f  %10f\n', yval, fcube ( tval ) );
          fprintf ( 1, '          %10f  %10f\n', ypval, fpcube ( tval ) );
          fprintf ( 1, '          %10f  %10f\n', yppval, fppcube ( tval ) );

        end
      end

    end

  end

  return
end

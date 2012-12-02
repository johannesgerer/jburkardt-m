function spline_test125 ( )

%*****************************************************************************80
%
%% TEST125 tests LEAST_SET_OLD, LEAST_VAL_OLD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2007
%
%  Author:
%
%    John Burkardt
%
  maxdeg = 6;
  ntab = 21;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST125\n' );
  fprintf ( 1, '  LEAST_SET_OLD sets a least squares polynomial,\n' );
  fprintf ( 1, '  LEAST_VAL_OLD evaluates it.\n' );

  for i = 1 : ntab
    xtab(i) = ( ( ntab - i     ) * ( -1.0 )   ...
              + (        i - 1 ) * ( +1.0 ) ) ...
              / ( ntab     - 1 );
    ytab(i) = ( floor ( exp ( xtab(i) ) * 100.0 + 0.5 ) ) / 100.0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', ntab );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X             Y\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntab
    fprintf ( 1, '%14f  %14f\n', xtab(i), ytab(i) );
  end

  for ndeg = 1 : maxdeg

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Use a polynomial of degree: %d\n', ndeg );
    fprintf ( 1, '\n' );

    [ ptab, b, c, d, eps, ierror ] = least_set_old ( ntab, xtab, ytab, ndeg );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Total approximation error = %f\n', eps );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  X, F(X), P(X), Error\n' );
    fprintf ( 1, '\n' );

    for i = 1 : ntab

      if ( i < ntab )
        jhi = 2;
      else
        jhi = 0;
      end

      for j = 0 : jhi

        if ( i < ntab )

          xval = ( ( 3 - j ) * xtab(i)     ...
                 + (     j ) * xtab(i+1) ) ...
                 / ( 3     );

        else

          xval = xtab(i);

        end

        yval = least_val_old ( xval, ndeg, b, c, d );

        ytrue = ( floor ( exp ( xval ) * 100.0 + 0.5 ) ) / 100.0;

        fprintf ( 1, '%14f  %14f  %14f  %14f\n', xval, yval, ytrue, ...
          yval - ytrue );

      end

    end

  end

  return
end

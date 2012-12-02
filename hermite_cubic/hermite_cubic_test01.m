function hermite_cubic_test01 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST01 tests HERMITE_CUBIC_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST01:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_VALUE evaluates a Hermite cubic polynomial.\n' );
  fprintf ( 1, '  Try out four sets of data:\n' );
  fprintf ( 1, '  (F1,D1,F2,D2) = (1,0,0,0), (0,1,0,0), (0,0,1,0), (0,0,0,1)\n' );
  fprintf ( 1, '  on [0,1] and [1.0,-2.0] (interval reversed)\n' );

  for x_interval = 1 : 2

    if ( x_interval == 1 )
      x1 = 0.0;
      x2 = 1.0;
    else
      x1 = 1.0;
      x2 = -2.0;
    end

    for i = 1 : 4
      f1 = 0.0;
      d1 = 0.0;
      f2 = 0.0;
      d2 = 0.0;
      if ( i == 1 )
        f1 = 1.0;
      elseif ( i == 2 )
        d1 = 1.0;
      elseif ( i == 3 )
        f2 = 1.0;
      elseif ( i == 4 )
        d2 = 1.0;
      end

      fprintf ( 1, '\n' );
      fprintf ( 1, '    J      X           F           D\n' );
      fprintf ( 1, '\n' );
      for j = - 3 : 12
        x = ( ( 10 - j ) * x1   ...
            +        j   * x2 ) ...
              / 10.0;

        [ f, d, s, t ] = hermite_cubic_value ( x1, f1, d1, x2, f2, d2, 1, x );

        if ( j == 0 )
          fprintf ( 1, '*Data  %10f  %10f  %10f\n', x1, f1, d1 );
        end
        fprintf ( 1, '  %3d  %10f  %10f  %10f\n', j, x, f, d );
        if ( j == 10 )
           fprintf ( 1, '*Data  %10f  %10f  %10f\n', x2, f2, d2 );
        end

      end

    end

  end

  return
end

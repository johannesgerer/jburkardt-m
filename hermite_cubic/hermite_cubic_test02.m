function hermite_cubic_test02 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST02 tests HERMITE_CUBIC_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST02:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_VALUE evaluates a Hermite cubic polynomial.\n' );
  fprintf ( 1, '  Try out data from a cubic function:\n' );
  fprintf ( 1, '  on [0,10] and [-1.0,1.0] and [0.5,0.75]\n' );

  for x_interval = 1 : 3

    if ( x_interval == 1 )
      x1 = 0.0;
      x2 = 10.0;
    elseif ( x_interval == 2 )
      x1 = -1.0;
      x2 = +1.0;
    elseif ( x_interval == 3 )
      x1 = 0.5;
      x2 = 0.75;
    end

    [ f1, d1, s1, t1 ] = cubic_value ( x1 );
    [ f2, d2, s2, t2 ] = cubic_value ( x2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    J      X           F           D           S           T\n' );

    for j = - 3 : 12
      x = ( ( 10 - j ) * x1   ...
          +        j   * x2 ) ...
            / 10.0;

      [ f, d, s, t ] = hermite_cubic_value ( x1, f1, d1, x2, f2, d2, 1, x );
      [ fc, dc, sc, tc ] = cubic_value ( x );

      fprintf ( 1, '\n' );
      if ( j == 0 )
        fprintf ( 1, '*Data  %10f  %10f  %10f\n', x1, f1, d1 );
      end
      fprintf ( 1, 'Exact  %10f  %10f  %10f  %10f  %10f\n',    x,  fc, dc, sc, tc );
      fprintf ( 1, '  %3d  %10f  %10f  %10f  %10f  %10f\n', j, x,  f,  d,  s,  t );
      if ( j == 10 )
        fprintf ( 1, '*Data  %10f  %10f  %10f\n', x2, f2, d2 );
      end

    end

  end

  return
end

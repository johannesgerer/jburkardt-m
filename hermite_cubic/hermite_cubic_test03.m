function hermite_cubic_test03 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST03 tests HERMITE_CUBIC_INTEGRATE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST03:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_INTEGRATE integrates a Hermite cubic\n' );
  fprintf ( 1, '  polynomial from A to B.\n' );

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
    fprintf ( 1, '                                 Exact       Computed\n' );
    fprintf ( 1, '    J      A           B         Integral    Integral\n' );
    fprintf ( 1, '\n' );

    a = x1 - 1.0;

    for j = - 3 : 12

      b = ( ( 10 - j ) * x1   ...
          +        j   * x2 ) ...
            / 10.0;

      q_exact = cubic_integrate ( a, b );
      q_computed = hermite_cubic_integrate ( x1, f1, d1, x2, f2, d2, a, b );

      fprintf ( 1, '  %3d  %10f  %10f  %10.6g  %10.6g\n', ...
        j, a, b, q_exact, q_computed );

    end

  end

  return
end

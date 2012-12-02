function hermite_cubic_test07 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST07 tests HERMITE_CUBIC_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST07:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_INTEGRAL integrates a Hermite cubic\n' );
  fprintf ( 1, '  polynomial over the definition interval [X1,X2].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                            Exact       Computed\n' );
  fprintf ( 1, '     X1          X2         Integral    Integral\n' );
  fprintf ( 1, '\n' );

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

    q_exact = cubic_integrate ( x1, x2 );
    q_computed = hermite_cubic_integral ( x1, f1, d1, x2, f2, d2 );

    fprintf ( 1, '  %10f  %10f  %10.6g  %10.6g\n', ...
      x1, x2, q_exact, q_computed );

  end

  return
end

function triangle_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% TRIANGLE_MONTE_CARLO_TEST01 estimates integrals over the unit triangle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2014.
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  e_test = [ ...
    0, 0; ...
    1, 0; ...
    0, 1; ...
    2, 0; ...
    1, 1; ...
    0, 2; ...
    3, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Use TRIANGLE01_SAMPLE for a Monte Carlo estimate of an\n' );
  fprintf ( 1, '  integral over the interior of the unit triangle in 2D.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        1               X               Y ' );
  fprintf ( 1, '             X^2               XY             Y^2             X^3\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    fprintf ( 1, '  %8d', n );

    [ x, seed ] = triangle01_sample ( n, seed );

    for j = 1 : 7

      e(1:m) = e_test(1:m,j);

      value = monomial_value ( m, n, e, x );

      result = triangle01_area ( ) * sum ( value(1:n) ) / n;
      fprintf ( 1, '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );

  for j = 1 : 7

    e(1:m) = e_test(1:m,j);

    result = triangle01_monomial_integral ( e );
    fprintf ( 1, '  %14.6g', result );

  end

  fprintf ( 1, '\n' );

  return
end

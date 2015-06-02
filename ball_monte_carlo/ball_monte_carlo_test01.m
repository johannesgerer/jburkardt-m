function ball_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% BALL_MONTE_CARLO_TEST01 uses BALL01_SAMPLE with an increasing number of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2014
%
%  Author:
%
%    John Burkardt
%
  e_test = [ ...
    0, 0, 0; ...
    2, 0, 0; ...
    0, 2, 0; ...
    0, 0, 2; ...
    4, 0, 0; ...
    2, 2, 0; ...
    0, 0, 4 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Estimate integrals over the interior of the unit ball\n' );
  fprintf ( 1, '  using the Monte Carlo method.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        1              X^2             Y^2' )'
  fprintf ( 1, '             Z^2             X^4           X^2Y^2           Z^4\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = ball01_sample ( n, seed );

    fprintf ( 1, '  %8d', n );
    for j = 1 : 7
      e(1:3) = e_test(1:3,j);
      value = monomial_value ( 3, n, e, x );
      result(j) = ball01_volume ( ) * sum ( value(1:n) ) / n;
      fprintf ( 1, '  %14.6g', result(j) );
    end
    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );
  for j = 1 : 7
    e(1:3) = e_test(1:3,j);
    result(j) = ball01_monomial_integral ( e );
    fprintf ( 1, '  %14.6g', result(j) );
  end
  fprintf ( 1, '\n' );

  return
end

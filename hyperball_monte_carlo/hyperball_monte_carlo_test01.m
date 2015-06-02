function hyperball_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% HYPERBALL_MONTE_CARLO_TEST01 uses HYPERBALL01_SAMPLE in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;

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
  fprintf ( 1, '  Use the Monte Carlo method to estimate integrals \n' );
  fprintf ( 1, '  over the interior of the unit hyperball in M dimensions.\n' );
  fprintf ( 1, 'n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        1              X^2             Y^2' )'
  fprintf ( 1, '             Z^2             X^4           X^2Y^2           Z^4\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = hyperball01_sample ( m, n, seed );

    fprintf ( 1, '  %8d', n );
    for j = 1 : 7
      e(1:m) = e_test(1:m,j);
      value = monomial_value ( m, n, e, x );
      result(j) = hyperball01_volume ( m ) * sum ( value(1:n) ) / n;
      fprintf ( 1, '  %14.6g', result(j) );
    end
    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );
  for j = 1 : 7
    e(1:m) = e_test(1:m,j);
    result(j) = hyperball01_monomial_integral ( m, e );
    fprintf ( 1, '  %14.6g', result(j) );
  end
  fprintf ( 1, '\n' );

  return
end

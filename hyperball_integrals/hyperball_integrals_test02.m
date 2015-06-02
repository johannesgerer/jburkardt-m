function hyperball_integrals_test02 ( )

%*****************************************************************************80
%
%% HYPERBALL_INTEGRALS_TEST02 compares exact and estimated integrals in 6D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 6;
  n = 4192;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERBALL_INTEGRALS_TEST02\n' );
  fprintf ( 1, '  Use the Monte Carlo method to estimate integrals over\n' );
  fprintf ( 1, '  the interior of the unit hyperball in M dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
%
%  Get sample points.
%
  seed = 123456789;
  [ x, seed ] = hyperball01_sample ( m, n, seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points used is %d\n', n );
%
%  Randomly choose exponents between 0 and 6.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If any exponent is odd, the integral is zero.\n' );
  fprintf ( 1, '  We will restrict this test to randomly chosen even exponents.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  E1  E2  E3  E4  E5  E6     MC-Estimate           Exact      Error\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ e, seed ] = i4vec_uniform_ab ( m, 0, 3, seed );

    e(1:m) = e(1:m) * 2;

    value = monomial_value ( m, n, e, x );

    result = hyperball01_volume ( m ) * sum ( value(1:n) ) / n;
    exact = hyperball01_monomial_integral ( m, e );
    error = abs ( result - exact );

    fprintf ( 1, '  %2d  %2d  %2d  %2d  %2d  %2d  %14.6g  %14.6g  %10.2e\n', ...
      e(1:m), result, exact, error );

  end

  return
end

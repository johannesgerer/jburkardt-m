function triangle01_integrals_test01 ( )

%*****************************************************************************80
%
%% TRIANGLE01_INTEGRALS_TEST01 estimates integrals over the unit triangle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2014.
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  n = 4192;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE01_INTEGRALS_TEST01\n' );
  fprintf ( 1, '  Estimate monomial integrals using Monte Carlo\n' );
  fprintf ( 1, '  over the interior of the unit triangle in 2D.\n' );
%
%  Get sample points.
%
  seed = 123456789;
  [ x, seed ] = triangle01_sample ( n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points used is %d\n', n );
%
%  Randomly choose X, Y exponents.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We restrict this test to randomly chosen even exponents.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ex  Ey     MC-Estimate      Exact           Error\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 4
    e(1) = i;
    for j = 0 : 4
      e(2) = j;

      value = monomial_value ( m, n, e, x );

      result = triangle01_area ( ) * sum ( value(1:n) ) / n;
      exact = triangle01_monomial_integral ( e );
      error = abs ( result - exact );

      fprintf ( 1, '  %2d  %2d  %14.6g  %14.6g  %10.2e\n', ...
        e(1:m), result, exact, error );

    end
  end

  return
end

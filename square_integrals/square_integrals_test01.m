function square_integrals_test01 ( )

%*****************************************************************************80
%
%% SQUARE_INTEGRALS_TEST01 compares exact and estimated integrals over the unit square in 2D
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  n = 4192;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Compare exact and estimated integrals\n' );
  fprintf ( 1, '  over the interior of the unit square in 2D.\n' );
%
%  Get sample points.
%
  seed = 123456789;
  [ x, seed ] = square01_sample ( n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points used is %d\n', n );
%
%  Randomly choose exponents.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ex  Ey     MC-Estimate           Exact      Error\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ e, seed ] = i4vec_uniform_ab ( m, 0, 7, seed );

    value = monomial_value ( m, n, e, x );

    result = square01_area ( ) * sum ( value(1:n) ) / n;
    exact = square01_monomial_integral ( e );
    error = abs ( result - exact );

    fprintf ( 1, '  %2d  %2d  %14.6g  %14.6g  %10.2e\n', ...
      e(1:m), result, exact, error );

  end

  return
end

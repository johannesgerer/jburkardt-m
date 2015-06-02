function cube_integrals_test01 ( )

%*****************************************************************************80
%
%% CUBE_INTEGRALS_TEST01 compares exact and estimated integrals over the unit cube in 3D
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
  m = 3;
  n = 4192;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Compare exact and estimated integrals\n' );
  fprintf ( 1, '  over the interior of the unit cube in 3D.\n' );
%
%  Get sample points.
%
  seed = 123456789;
  [ x, seed ] = cube01_sample ( n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points used is %d\n', n );
%
%  Randomly choose exponents.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ex  Ey  Ez     MC-Estimate           Exact      Error\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ e, seed ] = i4vec_uniform_ab ( m, 0, 7, seed );

    value = monomial_value ( m, n, e, x );

    result = cube01_volume ( ) * sum ( value(1:n) ) / n;
    exact = cube01_monomial_integral ( e );
    error = abs ( result - exact );

    fprintf ( 1, '  %2d  %2d  %2d  %14.6g  %14.6g  %10.2e\n', ...
      e(1:m), result, exact, error );

  end

  return
end

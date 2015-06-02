function tetrahedron_integrals_test01 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_INTEGRALS_TEST01 compares exact and estimated integrals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  n = 4192;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_INTEGRALS_TEST01\n' );
  fprintf ( 1, '  Estimate monomial integrals using Monte Carlo\n' );
  fprintf ( 1, '  over the interior of the unit tetrahedron in 3D.\n' );
%
%  Get sample points.
%
  seed = 123456789;
  [ x, seed ] = tetrahedron01_sample ( n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points used is %d\n', n );
%
%  Run through the exponents.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ex  Ey  Ez     MC-Estimate      Exact           Error\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 3
    e(1) = i;
    for j = 0 : 3
      e(2) = j;
      for k = 0 : 3
        e(3) = k;

        value = monomial_value ( m, n, e, x );

        result = tetrahedron01_volume ( ) * sum ( value(1:n) ) / n;
        exact = tetrahedron01_monomial_integral ( e );
        error = abs ( result - exact );

        fprintf ( 1, '  %2d  %2d  %2d  %14.6g  %14.6g  %10.2e\n', ...
          e(1:m), result, exact, error );

      end
    end
  end

  return
end

function sphere_integrals_test01 ( )

%*****************************************************************************80
%
%% SPHERE_INTEGRALS_TEST01 uses SPHERE01_SAMPLE to estimate monomial integrands.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_INTEGRALS_TEST01\n' );
  fprintf ( 1, '  Estimate monomial integrands using Monte Carlo\n' );
  fprintf ( 1, '  over the surface of the unit sphere in 3D.\n' );
%
%  Get sample points.
%
  n = 8192;
  seed = 123456789;
  [ x, seed ] = sphere01_sample ( n, seed );
%
%  Randomly choose X,Y,Z exponents between (0,0,0) and (9,9,9).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If any exponent is odd, the integral is zero.\n' );
  fprintf ( 1, '  We will restrict this test to randomly chosen even exponents.\n' );
  fprintf ( 1, '\n' ); 
  fprintf ( 1, '  Ex  Ey  Ez     MC-Estimate           Exact      Error\n' );
  fprintf ( 1, '\n' );
  test_num = 20;
  for test = 1 : test_num
    [ e, seed ] = i4vec_uniform_ab ( m, 0, 4, seed );
    e(1:m) = e(1:m) * 2;

    value = monomial_value ( m, n, e, x );

    result = sphere01_area ( ) * sum ( value(1:n) ) / ( n );
    exact = sphere01_monomial_integral ( e );
    error = abs ( result - exact );

    fprintf ( 1, '  %2d  %2d  %2d  %14.6g  %14.6g  %10.2e\n', ... 
      e(1:m), result, exact, error );
  end

  return
end

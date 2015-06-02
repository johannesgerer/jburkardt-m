function pyramid_integrals_test01 ( )

%*****************************************************************************80
%
%% PYRAMID_INTEGRALS_TEST01 compares exact and estimated monomial integrals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  n = 500000;
  e_max = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_INTEGRALS_TEST01\n' );
  fprintf ( 1, '  Compare exact and estimated integrals\n' );
  fprintf ( 1, '  over the unit pyramid in 3D.\n' );
%
%  Get sample points.
%
  seed = 123456789;
  [ x, seed ] = pyramid01_sample ( n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points used is %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   E1  E2  E3     MC-Estimate      Exact           Error\n' );
  fprintf ( 1, '\n' );
%
%  Check all monomials, with only even dependence on X or Y, 
%  up to total degree E_MAX.
%
  for e3 = 0 : e_max
    expon(3) = e3;
    for e2 = 0 : 2 : e_max - e3
      expon(2) = e2;
      for e1 = 0 : 2 : e_max - e3 - e2
        expon(1) = e1;

        value = monomial_value ( m, n, e, x );

        q = pyramid01_volume ( ) * sum ( value(1:n) ) / n;
        exact = pyramid01_integral ( expon );
        error = abs ( q - exact );

        fprintf ( 1, '  %2d  %2d  %2d  %14.6g  %14.6g  %10.2e\n', ...
          expon(1:3), q, exact, error );

      end
    end
  end

  return
end

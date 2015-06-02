function hermite_polynomial_test17 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST17 tests HEN_PROJECTION and HEN_PROJECTION_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST17:\n' );
  fprintf ( 1, '  HEN_PROJECTION is given a function F(x), and computes\n' );
  fprintf ( 1, '  N+1 coefficients C that define Fhat(x), the projection of F(x)\n' );
  fprintf ( 1, '  onto the first N+1 normalized Hermite polynomials Hen(i,x).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  It should be the case that the following two integrals are equal\n' );
  fprintf ( 1, '  for J = 0 to N:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q1 = integral ( -oo < x < oo ) f(x)    Hen(j,x) exp(-x*x/2) dx\n' );
  fprintf ( 1, '  Q2 = integral ( -oo < x < oo ) Fhat(x) Hen(j,x) exp(-x*x/2) dx\n' );
%
%  Project f = poly1(1) onto Hermite polynomials 0 through 6.
%
  n = 6;
  c1 = hen_projection ( n, @poly1 );
%
%  Get a quadrature rule suitable for products of Hermite polynomials
%  up to degree 6.
%
  m = n + 1;
  [ x, w ] = he_quadrature_rule ( m );
%
%  Evaluate Hermite polynomials 0 through N at the M quadrature points.
%
  phi = hen_polynomial_value ( m, n, x );
%
%  Evaluate the projected function, and the original function, at the quadrature points.
%
  v1 = poly1 ( m, x );
  v2 = hen_projection_value ( n, c1, m, x );
%
%  Compare the integrals of the function and its projection against
%  the Hermite polynomials of degree 0 through N.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '   J    Q1        Q2\n' );
  fprintf ( 1, '\n' );
  for j = 0 : n
    q1 = 0.0;
    q2 = 0.0;
    for i = 1 : m
      q1 = w(i) * v1(i) * phi(i,j+1);
      q2 = w(i) * v2(i) * phi(i,j+1);
    end
    fprintf ( 1, '  %2d  %8g  %8g\n', j, q1, q2 );
  end

  return
end

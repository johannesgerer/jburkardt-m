function hermite_polynomial_test18 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST18 tests HEN_PROJECTION_DATA.
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
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST18:\n' );
  fprintf ( 1, '  HEN_PROJECTION_DATA is given M data points (x,fx)\n' );
  fprintf ( 1, '  and uses least squares to derive projection coefficients\n' );
  fprintf ( 1, '  onto the first N+1 normalized Hermite polynomials Hen(0:n,x).\n' );
%
%  Project 20 data values (x,exp(x)) onto Hermite polynomials 0 through 5.
%
  a = -5.0;
  b = +5.0;
  m = 21;
  x = ( linspace ( a, b, m ) )';
  d = exp ( x );
  n = 5;
  c = hen_projection_data ( m, n, x, d );
  r8vec_print ( n + 1, c, '  Hen(0:5) projection coefficients for 21 exp(x) data values' );
%
%  Project 6 data values from (x,exp(x)) onto Hermite polynomials 0 through 5.
%
  a = -5.0;
  b = +5.0;
  m = 6;
  x = ( linspace ( a, b, m ) )';
  d = exp ( x );
  n = 5;
  c = hen_projection_data ( m, n, x, d );
  r8vec_print ( n + 1, c, '  Hen(0:5) projection coefficients for 6 exp(x) data values' );
%
%  Project exp(x) onto Hermite polynomials 0 through 5.
%
  n = 5;
  c = hen_projection ( n, @exp_fun );
  r8vec_print ( n + 1, c, '  Hen(0:5) projection coefficients for exp(x) function' );

  return
end

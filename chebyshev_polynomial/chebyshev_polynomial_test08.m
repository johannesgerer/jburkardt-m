function chebyshev_polynomial_test08 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST08 tests T_PROJECT_COEFFICIENTS_DATA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST08:\n' );
  fprintf ( 1, '  T_PROJECT_COEFFICIENTS_DATA computes the Chebyshev\n' );
  fprintf ( 1, '  coefficients of a function defined by data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We are looking for an approximation that is good in [-1,+1].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Begin by using equally spaced points in [-1,+1].\n' );

  a = -1.0;
  b = +1.0;
  m = 10;
  x = ( linspace ( a, b, m ) )';
  d = exp ( x );
  n = 3;
  c = t_project_coefficients_data ( a, b, m, n, x, d );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for exp(x) on [-1,+1]' );

  a = -1.0;
  b = +1.0;
  m = 10;
  x = ( linspace ( a, b, m ) )';
  d = exp ( x );
  n = 5;
  c = t_project_coefficients_data ( a, b, m, n, x, d );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for exp(x) on [-1,+1]' );

  a = -1.0;
  b = +1.0;
  m = 10;
  x = ( linspace ( a, b, m ) )';
  d = sin ( x );
  n = 5;
  c = t_project_coefficients_data ( a, b, m, n, x, d );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for sin(x) on [-1,+1]' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now sample equally spaced points in [0,+1].\n' );
  fprintf ( 1, '  The approximation still applies to the interval [-1,+1].\n' );

  a = 0.0;
  b = +1.0;
  m = 10;
  x = ( linspace ( a, b, m ) )';
  d = sin ( x );
  n = 5;
  c = t_project_coefficients_data ( a, b, m, n, x, d );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for sin(x) on [0,+1]' );

  a = 0.0;
  b = +1.0;
  m = 10;
  x = ( linspace ( a, b, m ) )';
  d = sqrt ( x );
  n = 5;
  c = t_project_coefficients_data ( a, b, m, n, x, d );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for sqrt(x) on [0,+1]' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now random points in [-1,+1].\n' );

  a = -1.0;
  b = +1.0;
  m = 10;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( m, seed );
  x = x * b + ( 1.0 - x ) * a;
  d = sin ( x );
  n = 5;
  c = t_project_coefficients_data ( a, b, m, n, x, d );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for sin(x) on [-1,+1]' );

  return
end

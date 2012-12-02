function chebyshev_polynomial_test07 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST07 tests T_PROJECT_COEFFICIENTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST07:\n' );
  fprintf ( 1, '  T_PROJECT_COEFFICIENTS computes the Chebyshev coefficients\n' );
  fprintf ( 1, '  of a function defined over [-1,+1].\n' );
  fprintf ( 1, '  T_PROJECT_COEFFICIENTS_AB works in [A,B].\n' );

  n = 3;
  c = t_project_coefficients ( n, @exp );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for exp(x) in [-1,+1]' );

  n = 5;
  c = t_project_coefficients ( n, @exp );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for exp(x) in [-1,+1]' );

  n = 5;
  c = t_project_coefficients ( n, @sin );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for sin(x) in [-1,+1]' );
%
%  Repeat calculation with T_PROJECT_COEFFICIENTS_AB.
%
  n = 5;
  c = t_project_coefficients_ab ( n, @sin, -1.0, +1.0 );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for sin(x) in [-1,+1]' );
%
%  Now try a different interval.
%
  n = 5;
  c = t_project_coefficients_ab ( n, @sqrt, 0.0, 1.0 );
  r8vec_print ( n + 1, c, '  Chebyshev coefficients for sqrt(x) in [0,+1]' );

  return
end

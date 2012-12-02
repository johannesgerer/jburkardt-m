function chebyshev_polynomial_test10 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST10 compares a function and projection over [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST10:\n' );
  fprintf ( 1, '  T_PROJECT_COEFFICIENTS_AB computes the Chebyshev interpolant C(F)(N,X)\n' );
  fprintf ( 1, '  of a function F(X) defined over [A,B].\n' );
  fprintf ( 1, '  T_PROJECT_VALUE_AB evaluates that projection.\n' );

  a = 0.0;
  b = 1.5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute projections of order N to exp(x) over [%f, %f],\n', a, b );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   Max||F(X)-C(F)(N,X)||\n' );
  fprintf ( 1, '\n' );
  for n = 0 : 10
    c = t_project_coefficients_ab ( n, @exp, a, b );
    m = 101;
    x = ( linspace ( a, b, m ) )';
    v = t_project_value_ab ( m, n, x, c, a, b );
    r = v - exp ( x );
    fprintf ( 1, '  %2d  %12.4g\n', n, max ( abs ( r ) ) );
  end

  return
end

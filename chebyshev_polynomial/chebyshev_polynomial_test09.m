function chebyshev_polynomial_test09 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST09 compares a function and projection over [-1,+1].
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
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST09:\n' );
  fprintf ( 1, '  T_PROJECT_COEFFICIENTS computes the Chebyshev interpolant C(F)(N,X)\n' );
  fprintf ( 1, '  of a function F(X) defined over [-1,+1].\n' );
  fprintf ( 1, '  T_PROJECT_VALUE evaluates that projection.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute projections of order N to exp(x) over [-1,+1],\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   Max||F(X)-C(F)(N,X)||\n' );
  fprintf ( 1, '\n' );
  for n = 0 : 10
    c = t_project_coefficients ( n, @exp );
    m = 101;
    x = ( linspace ( -1.0, +1.0, m ) )';
    v = t_project_value ( m, n, x, c );
    r = v - exp ( x );
    fprintf ( 1, '  %2d  %12.4g\n', n, max ( abs ( r ) ) );
  end

  return
end

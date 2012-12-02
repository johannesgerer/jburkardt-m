function c = t_project_coefficients_data ( a, b, m, n, x, d )

%*****************************************************************************80
%
%% T_PROJECT_COEFFICIENTS_DATA: project data onto T(0:n,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the domain of definition.
%
%    Input, integer M, the number of data values.
%
%    Input, integer N, the desired order of the Chebyshev expansion.
%
%    Input, real X(M,1), the data abscissas.  These need not be sorted.
%    It must be the case that A <= X() <= B.
%
%    Input, real D(M,1), the data values.
%
%    Output, real C(N+1,1), the approximate Chebshev coefficients.
%
  x = x(:);
  d = d(:);

  if ( ~ r8vec_in_ab ( m, x, a, b ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'T_PROJECT_COEFFICIENTS_DATA- Fatal error!\n' );
    fprintf ( 1, '  Some X not in [A,B].\n' );
    error ( 'T_PROJECT_COEFFICIENTS_DATA - Fatal error!' )
  end
%
%  Compute the M by N+1 Chebyshev Vandermonde matrix.
%
  v = t_polynomial_ab ( a, b, m, n, x );
%
%  Compute the least-squares solution.
%
  c = v \ d;

  return
end

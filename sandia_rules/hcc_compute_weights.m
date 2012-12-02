function w = hcc_compute_weights ( n )

%*****************************************************************************80
%
%% HCC_COMPUTE_WEIGHTS computes Hermite-Cubic-Chebyshev-Spacing weights.
%
%  Discussion:
%
%    For the HCC rule, we assume that an interval has been divided by
%    M nodes X into Chebyshev-spaced subintervals, and that at each
%    abscissa both function and derivative information is available.
%    The piecewise cubic Hermite interpolant is constructed for this data.
%    The quadrature rule uses N = 2 * M abscissas, where each node is
%    listed twice, and the weights occur in pairs, with the first multiplying
%    the function value and the second the derivative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Output, real W(N), the weights of the rule.
%
  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCC_COMPUTE_WEIGHTS - Fatal error!\n' );
    fprintf ( 1, '  Order of rule N is not even.\n' );
    error ( 'HCC_COMPUTE_WEIGHTS - Fatal error!' );
  end

  m = floor ( n / 2 );

  x = clenshaw_curtis_compute_points ( m );

  w = hc_compute_weights_from_points ( m, x );

  return
end

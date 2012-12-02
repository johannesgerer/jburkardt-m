function x = hce_compute_points ( n )

%*****************************************************************************80
%
%% HCE_COMPUTE_POINTS: abscissas of a Hermite-Cubic-Equal-Spacing rule.
%
%  Discussion:
%
%    For the HCE rule, we assume that an interval has been divided by
%    M nodes X into equally spaced subintervals, and that at each
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
%    07 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCE_COMPUTE_POINTS - Fatal error!\n' );
    fprintf ( 1, '  Order of rule N is not even.\n' );
    error ( 'HCE_COMPUTE_POINTS - Fatal error!' );
  end

  m = floor ( n / 2 );
  x(1:2:n-1) = linspace ( -1.0, +1.0, m );
  x(2:2:n) = linspace ( -1.0, +1.0, m );

  return
end

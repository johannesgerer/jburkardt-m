function [ x, w ] = hce_compute_np ( n, np, p )

%*****************************************************************************80
%
%% HCE_COMPUTE computes a Hermite-Cubic-Equal-Spacing quadrature rule.
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
%    1 <= N.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  [ x, w ] = hce_compute ( n );

  return
end

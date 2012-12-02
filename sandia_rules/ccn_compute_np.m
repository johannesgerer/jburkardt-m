function [ x, w ] = ccn_compute_np ( n, np, x )

%*****************************************************************************80
%
%% CCN_COMPUTE_NP computes a nested Clenshaw Curtis quadrature rule.
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
  x = ccn_compute_points ( n );
  w = ccn_compute_weights ( n );

  return
end

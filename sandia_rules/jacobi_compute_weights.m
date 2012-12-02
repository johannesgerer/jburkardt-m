function w = jacobi_compute_weights ( order, alpha, beta )

%*****************************************************************************80
%
%% JACOBI_COMPUTE_WEIGHTS returns the weights of a Jacobi rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, real ALPHA, BETA, the exponents of the (1-X) and
%    (1+X) factors in the weight.
%
%    Output, real W(ORDER), the weights.
%
  [ points, w ] = jacobi_compute ( order, alpha, beta );

  return
end

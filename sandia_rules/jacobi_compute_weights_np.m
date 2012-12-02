function w = jacobi_compute_weights_np ( order, np, p )

%*****************************************************************************80
%
%% JACOBI_COMPUTE_WEIGHTS_NP returns the weights of a Jacobi rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real W(ORDER), the weights.
%
  alpha = p(1);
  beta = p(2);

  [ points, w ] = jacobi_compute ( order, alpha, beta );

  return
end

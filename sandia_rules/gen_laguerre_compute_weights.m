function weights = gen_laguerre_compute_weights ( order, alpha )

%*****************************************************************************80
%
%% GEN_LAGUERRE_COMPUTE_WEIGHTS returns the weights of a Generalized Laguerre rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, real ALPHA, the exponent of the X factor.
%    Set ALPHA = 0.0 for the simplest rule.
%    ALPHA must be nonnegative.
%
%    Output, real WEIGHTS(ORDER), the weights.
%
  [ points, weights ] = gen_laguerre_compute ( order, alpha );

  return
end

function weights = gen_hermite_compute_weights ( order, alpha )

%*****************************************************************************80
%
%% GEN_HERMITE_COMPUTE_WEIGHTS returns the weights of a Generalized Hermite rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
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
%    -1.0 < ALPHA.
%
%    Output, real WEIGHTS(ORDER), the weights.
%
  [ points, weights ] = gen_hermite_compute ( order, alpha );

  return
end

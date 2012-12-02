function w = gen_hermite_compute_weights_np ( order, np, p )

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

  [ points, w ] = gen_hermite_compute ( order, alpha );

  return
end

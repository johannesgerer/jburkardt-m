function weights = clenshaw_curtis_compute_weights_np ( order, np, p )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_COMPUTE_WEIGHTS_NP returns the weights of a Clenshaw Curtis rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [-1,1].
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
%    Output, real WEIGHTS(ORDER), the weights.
%
  weights = clenshaw_curtis_compute_weights ( order );

  return
end

function w = ccn_compute_weights_np ( n, np, p )

%*****************************************************************************80
%
%% CCN_COMPUTE_WEIGHTS_NP: weights for nested Clenshaw Curtis rule.
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
%    Input, integer N, the order of the rule.
%
%    Input, integer ( kind = 4 ) NP, the number of parameters.
%
%    Input, real ( kind = 8 ) P(NP), the parameters.
%
%    Output, real W(N), the weights.
%
  w = ccn_compute_weights ( n );

  return
end

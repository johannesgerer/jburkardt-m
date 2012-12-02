function w = laguerre_compute_weights_np ( order, np, p )

%*****************************************************************************80
%
%% LAGUERRE_COMPUTE_WEIGHTS_NP computes the weights of a Laguerre quadrature rule.
%
%  Discussion:
%
%    This is simply a convenient interface.
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
%    John Burkardt.
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    ORDER must be greater than 0.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real W(ORDER), the weights of the rule.
%
  [ x, w ] = laguerre_compute ( order );

  return
end

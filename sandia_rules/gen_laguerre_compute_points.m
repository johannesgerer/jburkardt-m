function points = gen_laguerre_compute_points ( order, alpha )

%*****************************************************************************80
%
%% GEN_LAGUERRE_COMPUTE_POINTS returns the points of a Generalized Laguerre rule.
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
%    Output, real POINTS(ORDER), the abscissas.
%
  [ points, weights ] = gen_laguerre_compute ( order, alpha );

  return
end

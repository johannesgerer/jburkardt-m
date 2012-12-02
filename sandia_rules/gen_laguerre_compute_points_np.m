function points = gen_laguerre_compute_points_np ( order, np, p )

%*****************************************************************************80
%
%% GEN_LAGUERRE_COMPUTE_POINTS_NP returns the points of a Generalized Laguerre rule.
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
%    Output, real POINTS(ORDER), the abscissas.
%
  alpha = p(1);

  [ points, w ] = gen_laguerre_compute ( order, alpha );

  return
end

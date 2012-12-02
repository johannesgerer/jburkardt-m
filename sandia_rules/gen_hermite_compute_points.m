function points = gen_hermite_compute_points ( order, alpha )

%*****************************************************************************80
%
%% GEN_HERMITE_COMPUTE_POINTS returns the points of a Generalized Hermite rule.
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
%    Output, real POINTS(ORDER), the abscissas.
%
  [ points, weights ] = gen_hermite_compute ( order, alpha );

  return
end

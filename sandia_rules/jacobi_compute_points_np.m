function points = jacobi_compute_points_np ( order, np, p )

%*****************************************************************************80
%
%% JACOBI_COMPUTE_POINTS_NP returns the points of a Jacobi rule.
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
  beta = p(2);

  [ points, w ] = jacobi_compute ( order, alpha, beta );

  return
end

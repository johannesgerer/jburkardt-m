function points = jacobi_compute_points ( order, alpha, beta )

%*****************************************************************************80
%
%% JACOBI_COMPUTE_POINTS returns the points of a Jacobi rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, real ALPHA, BETA, the exponents of the (1-X) and
%    (1+X) factors in the weight.
%
%    Output, real POINTS(ORDER), the abscissas.
%
  [ points, weight ] = jacobi_compute ( order, alpha, beta );

  return
end

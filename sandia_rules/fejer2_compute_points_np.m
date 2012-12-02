function points = fejer2_compute_points_np ( order, np, p )

%*****************************************************************************80
%
%% FEJER2_COMPUTE_POINTS_NP returns the abscissas of a Fejer type 2 rule.
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
%    Output, real POINTS(ORDER), the abscissas.
%
  points = fejer2_compute_points ( order );

  return
end

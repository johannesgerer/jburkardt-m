function [ x, w ] = rule_adjust ( a, b, c, d, norder, x, w )

%*****************************************************************************80
%
%% RULE_ADJUST maps a quadrature rule from [A,B] to [C,D].
%
%  Discussion:
%
%    Most quadrature rules are defined on a special interval, like
%    [-1,1] or [0,1].  To integrate over an interval, the abscissas
%    and weights must be adjusted.  This can be done on the fly,
%    or by calling this routine.
%
%    If the weight function W(X) is not 1, then the W vector will
%    require further adjustment by the user.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the definition interval.
%
%    Input, real C, D, the endpoints of the integration interval.
%
%    Input, integer NORDER, the number of abscissas and weights.
%
%    Input, real X(NORDER), W(NORDER), the abscissas and weights.
%
%    Output, real X(NORDER), W(NORDER), the adjusted abscissas and weights.
%
  x(1:norder) = ( ( b - x(1:norder)     ) * c   ...
                + (     x(1:norder) - a ) * d ) ...
                / ( b               - a );

  w(1:norder) = ( ( d - c ) / ( b - a ) ) * w(1:norder);

  return
end

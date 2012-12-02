function value = asinh2 ( x )

%*****************************************************************************80
%
%% ASINH2 returns the inverse hyperbolic sine of a number.
%
%  Definition:
%
%    The assertion that:
%
%      Y = ASINH2(X)
%
%    implies that
%
%      X = SINH(Y) = 0.5 * ( EXP(Y) - EXP(-Y) ).
%
%  Discussion:
%
%    Since a library function ASINH may be available on some systems,
%    this routine is named ASINH2 to avoid name conflicts.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose inverse hyperbolic sine is desired.
%
%    Output, real VALUE, the inverse hyperbolic sine of X.
%
  value = log ( x + sqrt ( x * x + 1.0 ) );

  return
end

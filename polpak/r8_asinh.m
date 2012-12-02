function value = r8_asinh ( x )

%*****************************************************************************80
%
%% R8_ASINH returns the inverse hyperbolic sine of a number.
%
%  Discussion:
%
%    The assertion that:
%
%      Y = R8_ASINH ( X )
%
%    implies that
%
%      X = SINH(Y) = 0.5 * ( EXP(Y) - EXP(-Y) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose inverse hyperbolic
%    sine is desired.
%
%    Output, real VALUE, the inverse hyperbolic sine of X.
%
  value = log ( x + sqrt ( x .* x + 1.0 ) );

  return
end

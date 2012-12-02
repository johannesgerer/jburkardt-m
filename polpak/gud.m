function value = gud ( x )

%*****************************************************************************80
%
%% GUD evaluates the Gudermannian function.
%
%  Definition:
%
%    The Gudermannian function relates the hyperbolic and trigonometric
%    functions.  For any argument X, there is a corresponding value
%    GAMMA so that
%
%      sinh(x) = tan(gamma).
%
%    The value GAMMA is called the Gudermannian of X.
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
%    Input, real X, the argument of the Gudermannian.
%
%    Output, real VALUE, the value of the Gudermannian.
%
  value = 2.0 * atan ( tanh ( 0.5 * x ) );

  return
end

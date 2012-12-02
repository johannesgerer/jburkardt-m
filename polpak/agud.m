function value = agud ( gamma )

%*****************************************************************************80
%
%% AGUD evaluates the inverse Gudermannian function.
%
%  Definition:
%
%    The Gudermannian function relates the hyperbolic and trigonomentric
%    functions.  For any argument X, there is a corresponding value
%    GAMMA so that
%
%      SINH(X) = TAN(GAMMA).
%
%    This value GAMMA(X) is called the Gudermannian of X.  The inverse
%    Gudermannian function is given as input a value GAMMA and computes
%    the corresponding value X.
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
%    Input, real GAMMA, the value of the Gudermannian.
%
%    Output, real VALUE, the argument of the Gudermannian.
%
  value = log ( tan ( 0.25 * pi + 0.5 * gamma ) );

  return
end

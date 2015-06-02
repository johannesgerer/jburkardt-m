function value = agud ( g )

%*****************************************************************************80
%
%% AGUD evaluates the inverse Gudermannian function.
%
%  Discussion:
%
%    The Gudermannian function relates the hyperbolic and trigonomentric
%    functions.  For any argument X, there is a corresponding value
%    G so that
%
%      SINH(X) = TAN(G).
%
%    This value G(X) is called the Gudermannian of X.  The inverse
%    Gudermannian function is given as input a value G and computes
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
%    Input, real G, the value of the Gudermannian.
%
%    Output, real VALUE, the argument of the Gudermannian.
%
  value = log ( tan ( 0.25 * pi + 0.5 * g ) );

  return
end

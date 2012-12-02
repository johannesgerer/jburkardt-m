function f = p05_f ( x )

%*****************************************************************************80
%
%% P05_F evaluates the objective function for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    LE Scales,
%    Introduction to Non-Linear Optimization,
%    Springer, 1985.
%
%  Parameters:
%
%    Input, real X, the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f = exp ( x ) - 2.0 * x + 0.01 ./ x - 0.000001 ./ x ./ x;

  return
end

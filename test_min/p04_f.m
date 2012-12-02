function f = p04_f ( x )

%*****************************************************************************80
%
%% P04_F evaluates the objective function for problem 4.
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
  f = exp ( x ) + 0.01 ./ x;

  return
end

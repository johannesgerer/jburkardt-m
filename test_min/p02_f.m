function f = p02_f ( x )

%*****************************************************************************80
%
%% P02_F evaluates the objective function for problem 2.
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
  f = x .* x + exp ( - x );

  return
end

function f = p03_f ( x )

%*****************************************************************************80
%
%% P03_F evaluates the objective function for problem 3.
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
  f = ( ( x .* x + 2.0 ) .* x + 1.0 ) .* x + 3.0;

  return
end

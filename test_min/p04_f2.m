function f2 = p04_f2 ( x )

%*****************************************************************************80
%
%% P04_F2 evaluates the second derivative for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2002
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
%    Input, real X, the values of the variables.
%
%    Output, real F2, the second derivative.
%
  f2 = exp ( x ) + 0.02 / x / x / x;

  return
end

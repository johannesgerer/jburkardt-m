function f1 = p05_f1 ( x )

%*****************************************************************************80
%
%% P05_F1 evaluates the first derivative for problem 5.
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
%  Parameters:
%
%    Input, real X, the value of the variable.
%
%    Output, real F1, the first derivative of the
%    objective function.
%
  f1 = exp ( x ) - 2.0 - 0.01 / x / x + 0.000002 / x / x / x;

  return
end

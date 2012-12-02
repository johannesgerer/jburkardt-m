function f1 = p07_f1 ( x )

%*****************************************************************************80
%
%% P07_F1 evaluates the first derivative for problem 7.
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
  f1 = ( 1.0 - 2.0 * x * x + cos ( x ) ...
         - 2.0 * x * sin ( x ) ) * exp ( - x * x );

  return
end

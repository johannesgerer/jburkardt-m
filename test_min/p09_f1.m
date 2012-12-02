function f1 = p09_f1 ( x )

%*****************************************************************************80
%
%% P09_F1 evaluates the first derivative for problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2008
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
  f1 = 2.0 * x ...
    - 10.0 * cos ( x * x - 3.0 * x + 2.0 ) ...
    * ( 2.0 * x - 3.0 );

  return
end

function f2 = p07_f2 ( x )

%*****************************************************************************80
%
%% P07_F2 evaluates the second derivative for problem 7.
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
%    Input, real X, the values of the variables.
%
%    Output, real F2, the second derivative.
%
  f2 = ( - 4.0 - 2.0 * x - 4.0 * x * x * x ...
    - 3.0 * sin ( x ) - 4.0 * x * cos ( x ) ...
    + 4.0 * x * x * sin ( x ) ) * exp ( - x * x );

  return
end

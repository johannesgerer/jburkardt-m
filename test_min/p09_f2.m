function f2 = p09_f2 ( x )

%*****************************************************************************80
%
%% P09_F2 evaluates the second derivative for problem 9.
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
%    Input, real X, the values of the variables.
%
%    Output, real F2, the second derivative.
%
  f2 = 2.0  ...
    + 10.0 * sin ( x * x - 3.0 * x + 2.0 ) ...
    * ( 2.0 * x - 3.0 ) * ( 2.0 * x - 3.0 ) ...
    - 20.0 * cos ( x * x - 3.0 * x + 2.0 );

  return
end

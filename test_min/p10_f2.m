function f2 = p10_f2 ( x )

%*****************************************************************************80
%
%% P10_F2 evaluates the second derivative for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2009
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
  f2 = -                   cos (       x ) ...
       - 5.0 * 1.6 * 1.6 * cos ( 1.6 * x ) ...
       + 2.0 * 2.0 * 2.0 * cos ( 2.0 * x ) ...
       - 5.0 * 4.5 * 4.5 * cos ( 4.5 * x ) ...
       - 7.0 * 9.0 * 9.0 * cos ( 9.0 * x );

  return
end

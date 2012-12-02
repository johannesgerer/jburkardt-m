function f1 = p10_f1 ( x )

%*****************************************************************************80
%
%% P10_F1 evaluates the first derivative for problem 10.
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
%    Input, real X, the value of the variable.
%
%    Output, real F1, the first derivative of the
%    objective function.
%
  f1 = -             sin (           x ) ...
       - 5.0 * 1.6 * sin ( 1.6 * x ) ...
       + 2.0 * 2.0 * sin ( 2.0 * x ) ...
       - 5.0 * 4.5 * sin ( 4.5 * x ) ...
       - 7.0 * 9.0 * sin ( 9.0 * x );

  return
end

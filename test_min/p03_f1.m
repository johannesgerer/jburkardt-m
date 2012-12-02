function f1 = p03_f1 ( x )

%*****************************************************************************80
%
%% P03_F1 evaluates the first derivative for problem 3.
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
  f1 = ( 4.0 * x * x + 4.0 ) * x + 1.0;

  return
end

function f1 = p02_f1 ( x )

%*****************************************************************************80
%
%% P02_F1 evaluates the first derivative for problem 2.
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
  f1 = 2.0 * x - exp ( -x );

  return
end

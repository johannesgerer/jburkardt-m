function f1 = p08_f1 ( x )

%*****************************************************************************80
%
%% P08_F1 evaluates the first derivative for problem 8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2003
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
  if ( x == pi )
    f1 = 0.0;
  else
    f1 = 6.0 * x + ( 2.0 / ( x - pi ) ) / pi^4;
  end

  return
end

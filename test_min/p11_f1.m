function f1 = p11_f1 ( x )

%*****************************************************************************80
%
%% P11_F1 evaluates the first derivative for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2012
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
  if ( 3.0 * x - 1.0 < 0.0 )
    f1 = - 3.0;
  else
    f1 = + 3.0;
  end

  return
end

function f2 = p08_f2 ( x )

%*****************************************************************************80
%
%% P08_F2 evaluates the second derivative for problem 8.
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
%    Input, real X, the values of the variables.
%
%    Output, real F2, the second derivative.
%
  if ( x == pi )
    f2 = 1.0;
  else
    f2 = 6.0 + ( - 2.0 / ( x - pi ) / ( x - pi ) ) / pi^4;
  end

  return
end

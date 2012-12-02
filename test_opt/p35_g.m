function g = p35_g ( n, x )

%*****************************************************************************80
%
%% P35_G evaluates the gradient for problem 35.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  factor1 = 0.0;
  df1dx1 = 0.0;
  for i = 1 : 5
    y = i;
    factor1 = factor1 + y * cos ( ( y + 1.0 ) * x(1) + y );
    df1dx1 = df1dx1 - y * ( y + 1.0 ) * sin ( ( y + 1.0 ) * x(1) + y );
  end

  factor2 = 0.0;
  df2dx2 = 0.0;
  for i = 1 : 5
    y = i;
    factor2 = factor2 + y * cos ( ( y + 1.0 ) * x(2) + y );
    df2dx2 = df2dx2 - y * ( y + 1.0 ) * sin ( ( y + 1.0 ) * x(2) + y );
  end

  g(1) = df1dx1 * factor2;
  g(2) = factor1 * df2dx2;

  return
end

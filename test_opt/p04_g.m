function g = p04_g ( n, x )

%*****************************************************************************80
%
%% P04_G evaluates the gradient for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
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

  f1 = 10000.0 * x(1) * x(2) - 1.0;
  df1dx1 = 10000.0 * x(2);
  df1dx2 = 10000.0 * x(1);

  f2 = exp ( - x(1) ) + exp ( - x(2) ) - 1.0001;
  df2dx1 = - exp ( - x(1) );
  df2dx2 = - exp ( - x(2) );

  g(1) = 2.0 * f1 * df1dx1 + 2.0 * f2 * df2dx1;
  g(2) = 2.0 * f1 * df1dx2 + 2.0 * f2 * df2dx2;

  return
end

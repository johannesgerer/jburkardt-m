function g = p17_g ( n, x )

%*****************************************************************************80
%
%% P17_G evaluates the gradient for problem 17.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2000
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

  f1 = x(2) - x(1) * x(1);
  f2 = 1.0 - x(1);
  f3 = x(4) - x(3)^2;
  f4 = 1.0 - x(3);
  f5 = x(2) + x(4) - 2.0;
  f6 = x(2) - x(4);

  df1dx1 = - 2.0 * x(1);
  df1dx2 =   1.0;
  df2dx1 = - 1.0;
  df3dx3 = - 2.0 * x(3);
  df3dx4 =   1.0;
  df4dx3 = - 1.0;
  df5dx2 =   1.0;
  df5dx4 =   1.0;
  df6dx2 =   1.0;
  df6dx4 = - 1.0;

  g(1) = 2.0 * ( 100.0 * f1 * df1dx1 + f2 * df2dx1 );

  g(2) = 2.0 * ( 100.0 * f1 * df1dx2 + 10.0 * f5 * df5dx2 + 0.1 * f6 * df6dx2 );

  g(3) = 2.0 * ( 90.0 * f3 * df3dx3 + f4 * df4dx3 );

  g(4) = 2.0 * ( 90.0 * f3 * df3dx4 + 10.0 * f5 * df5dx4 + 0.1 * f6 * df6dx4 );

  return
end

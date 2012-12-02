function h = p17_h ( n, x )

%*****************************************************************************80
%
%% P17_H evaluates the Hessian for problem 17.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2000
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
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  f1 = x(2) - x(1)^2;
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

  d2f1dx11 = - 2.0;
  d2f3dx33 = - 2.0;

  h(1,1) = 200.0 * df1dx1 * df1dx1 + 200.0 * f1 * d2f1dx11 + 2.0 * df2dx1 * df2dx1;
  h(1,2) = 200.0 * df1dx2 * df1dx1;
  h(1,3) = 0.0;
  h(1,4) = 0.0;

  h(2,1) = 200.0 * df1dx1 * df1dx2;
  h(2,2) = 200.0 * df1dx2 * df1dx2 + 20.0 * df5dx2 * df5dx2 + 0.2 * df6dx2 * df6dx2;
  h(2,3) = 0.0;
  h(2,4) = 20.0 * df5dx4 * df5dx2 + 0.2 * df6dx4 * df6dx2;

  h(3,1) = 0.0;
  h(3,2) = 0.0;
  h(3,3) = 180.0 * df3dx3 * df3dx3 + 180.0 * f3 * d2f3dx33 + 2.0 * df4dx3 * df4dx3;
  h(3,4) = 180.0 * df3dx4 * df3dx3;

  h(4,1) = 0.0;
  h(4,2) = 20.0 * df5dx2 * df5dx4 + 0.2 * df6dx2 * df6dx4;
  h(4,3) = 180.0 * df3dx3 * df3dx4;
  h(4,4) = 180.0 * df3dx4 * df3dx4 + 20.0 * df5dx4 * df5dx4 + 0.2 * df6dx4 * df6dx4;

  return
end

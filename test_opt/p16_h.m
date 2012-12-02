function h = p16_h ( n, x )

%*****************************************************************************80
%
%% P16_H evaluates the Hessian for problem 16.
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
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  f1 = 1.5   - x(1) * ( 1.0 - x(2)    );
  f2 = 2.25  - x(1) * ( 1.0 - x(2) * x(2) );
  f3 = 2.625 - x(1) * ( 1.0 - x(2) * x(2) * x(2) );

  df1dx1 = - ( 1.0 - x(2) );
  df1dx2 = x(1);
  df2dx1 = - ( 1.0 - x(2) * x(2) );
  df2dx2 = 2.0 * x(1) * x(2);
  df3dx1 = - ( 1.0 - x(2) * x(2) * x(2) );
  df3dx2 = 3.0 * x(1) * x(2) * x(2);

  d2f1dx12 = 1.0;
  d2f1dx21 = 1.0;

  d2f2dx12 = 2.0 * x(2);
  d2f2dx21 = 2.0 * x(2);
  d2f2dx22 = 2.0 * x(1);

  d2f3dx12 = 3.0 * x(2) * x(2);
  d2f3dx21 = 3.0 * x(2) * x(2);
  d2f3dx22 = 6.0 * x(1) * x(2);

  h(1,1) = 2.0 * ( df1dx1 * df1dx1 ...
                     + df2dx1 * df2dx1 ...
                     + df3dx1 * df3dx1 );

  h(1,2) = 2.0 * ( df1dx2 * df1dx1 + f1 * d2f1dx12 ...
                     + df2dx2 * df2dx1 + f2 * d2f2dx12 ...
                     + df3dx2 * df3dx1 + f3 * d2f3dx12 );

  h(2,1) = 2.0 * ( df1dx1 * df1dx2 + f1 * d2f1dx21 ...
                     + df2dx1 * df2dx2 + f2 * d2f2dx21 ...
                     + df3dx1 * df3dx2 + f3 * d2f3dx21 );

  h(2,2) = 2.0 * ( df1dx2 * df1dx2 ...
                     + df2dx2 * df2dx2 + f2 * d2f2dx22 ...
                     + df3dx2 * df3dx2 + f3 * d2f3dx22 );

  return
end

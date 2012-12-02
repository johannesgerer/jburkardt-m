function g = p16_g ( n, x )

%*****************************************************************************80
%
%% P16_G evaluates the gradient for problem 16.
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

  f1 = 1.5   - x(1) * ( 1.0 - x(2)    );
  f2 = 2.25  - x(1) * ( 1.0 - x(2) * x(2) );
  f3 = 2.625 - x(1) * ( 1.0 - x(2) * x(2) * x(2) );

  df1dx1 = - ( 1.0 - x(2) );
  df1dx2 = x(1);
  df2dx1 = - ( 1.0 - x(2) * x(2) );
  df2dx2 = 2.0 * x(1) * x(2);
  df3dx1 = - ( 1.0 - x(2) * x(2) * x(2) );
  df3dx2 = 3.0 * x(1) * x(2) * x(2);

  g(1) = 2.0 * ( f1 * df1dx1 + f2 * df2dx1 + f3 * df3dx1 );
  g(2) = 2.0 * ( f1 * df1dx2 + f2 * df2dx2 + f3 * df3dx2 );

  return
end

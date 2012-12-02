function h = p04_h ( n, x )

%*****************************************************************************80
%
%% P04_H evaluates the Hessian for problem 4.
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
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  f1 = 10000.0 * x(1) * x(2) - 1.0;
  df1dx1 = 10000.0 * x(2);
  df1dx2 = 10000.0 * x(1);
  d2f1dx12 = 10000.0;
  d2f1dx21 = 10000.0;

  f2 = exp ( - x(1) ) + exp ( - x(2) ) - 1.0001;
  df2dx1 = - exp ( - x(1) );
  df2dx2 = - exp ( - x(2) );
  d2f2dx11 = exp ( - x(1) );
  d2f2dx22 = exp ( - x(2) );

  h(1,1) = 2.0 * df1dx1 * df1dx1 ...
    + 2.0 * f2 * d2f2dx11 + 2.0 * df2dx1 * df2dx1;

  h(1,2) = 2.0 * f1 * d2f1dx12 + 2.0 * df1dx2 * df1dx1 ...
    + 2.0 * df2dx2 * df2dx1;

  h(2,1) = 2.0 * f1 * d2f1dx21 + 2.0 * df1dx2 * df1dx1 ...
    + 2.0 * df2dx2 * df2dx1;

  h(2,2) = 2.0 * df1dx2 * df1dx2 ...
    + 2.0 * f2 * d2f2dx22 + 2.0 * df2dx2 * df2dx2;

  return
end

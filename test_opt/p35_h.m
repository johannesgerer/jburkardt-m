function h = p35_h ( n, x )

%*****************************************************************************80
%
%% P35_H evaluates the Hessian for problem 35.
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
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  factor1 = 0.0;
  df1dx1 = 0.0;
  df1dx11 = 0.0;
  for i = 1 : 5
    y = i;
    factor1 = factor1 + y * cos ( ( y + 1.0 ) * x(1) + y );
    df1dx1 = df1dx1 - y * ( y + 1.0 ) * sin ( ( y + 1.0 ) * x(1) + y );
    df1dx11 = df1dx11 - y * ( y + 1.0 )^2 * cos ( ( y + 1.0 ) * x(1) + y );
  end

  factor2 = 0.0;
  df2dx2 = 0.0;
  df2dx22 = 0.0;
  for i = 1 : 5
    y = i;
    factor2 = factor2 + y * cos ( ( y + 1.0 ) * x(2) + y );
    df2dx2 = df2dx2 - y * ( y + 1.0 ) * sin ( ( y + 1.0 ) * x(2) + y );
    df2dx22 = df2dx22 - y * ( y + 1.0 )^2 * cos ( ( y + 1.0 ) * x(2) + y );
  end

  h(1,1) = df1dx11 * factor2;
  h(1,2) = df1dx1 * df2dx2;
  h(2,1) = df1dx1 * df2dx2;
  h(2,2) = factor1 * df2dx22;

  return
end

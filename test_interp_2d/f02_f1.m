function [ fx, fy ] = f02_f1 ( n, x, y )

%*****************************************************************************80
%
%% F02_F1 returns first derivatives of function 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), Y(N,1), the evalution points.
%
%    Output, real FX(N,1), FY(N,1), the derivative values.
%
  t1(1:n,1) = 18.0 * ( y(1:n,1) - x(1:n,1) );
  fx(1:n,1) = - 4.0 ./ ( exp ( t1(1:n,1) ) + 2.0 + exp ( - t1(1:n,1) ) );
  fy(1:n,1) = - fx(1:n,1);

  return
end

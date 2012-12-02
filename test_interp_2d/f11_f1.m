function [ fx, fy ] = f11_f1 ( n, x, y )

%*****************************************************************************80
%
%% F11_F1 returns first derivatives of function f11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2012
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
  fx(1:n,1) = y(1:n,1) + 1.0;
  fy(1:n,1) = x(1:n,1);

  return
end

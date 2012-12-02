function [ fx, fy ] = f08_f1 ( n, x, y )

%*****************************************************************************80
%
%% F08_F1 returns first derivatives of function 8.
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
  t1(1:n,1) = 5.0 - 10.0 * x(1:n,1);
  t2(1:n,1) = 5.0 - 10.0 * y(1:n,1);
  t3(1:n,1) = exp ( - 0.5 * t1(1:n,1) .* t1(1:n,1) );
  t4(1:n,1) = exp ( - 0.5 * t2(1:n,1) .* t2(1:n,1) );

  fx(1:n,1) = t1(1:n,1) .* t3(1:n,1) .* ( 10.0 + 7.5 * t4(1:n,1) );
  fy(1:n,1) = t2(1:n,1) .* t4(1:n,1) .* ( 7.5 + 7.5 * t3(1:n,1) );

  return
end

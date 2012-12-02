function [ fx, fy ] = f10_f1 ( n, x, y )

%*****************************************************************************80
%
%% F10_F1 returns first derivatives of function 10.
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
  t1(1:n,1) = sqrt ( ( 80.0 * x(1:n,1) - 40.0 )^2 + ( 90.0 * y(1:n,1) - 45.0 )^2 );
  t2(1:n,1) = exp ( - 0.04 * t1(1:n,1) );
  t3(1:n,1) = cos ( 0.15 * t1(1:n,1) );
  t4(1:n,1) = sin ( 0.15 * t1(1:n,1) );

  fx = zeros ( n, 1 );
  fy = zeros ( n, 1 );

  i = find ( t1(1:n,1) ~= 0.0 );

  fx(i,1) = - t2(i,1) .* ( 12.0 * t4(i,1) + 3.2 * t3(i,1) ) .* ( 80.0 * x(i,1) - 40.0 ) ./ t1(i,1);
  fy(i,1) = - t2(i,1) .* ( 13.5 * t4(i,1) + 3.6 * t3(i,1) ) .* ( 90.0 * y(i,1) - 45.0 ) ./ t1(i,1);

  return
end

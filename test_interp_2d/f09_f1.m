function [ fx, fy ] = f09_f1 ( n, x, y )

%*****************************************************************************80
%
%% F09_F1 returns first derivatives of function 9.
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
  t1(1:n,1) = exp ( ( 10.0 - 20.0 * x(1:n,1) ) / 3.0 );
  t2(1:n,1) = exp ( ( 10.0 - 20.0 * y(1:n,1) ) / 3.0 );
  t3(1:n,1) = 1.0 ./ ( 1.0 + t1(1:n,1) );
  t4(1:n,1) = 1.0 ./ ( 1.0 + t2(1:n,1) );

  fx(1:n,1) = ( ( 20.0 / 3.0 ) * t1(1:n,1) ).^2 .* ( ( 20.0 / 3.0 ) * t3(1:n,1) ).^5 ...
    .* ( 2.0 * t1(1:n,1) - 3.0 * t3(1:n,1) - 5.0 + 12.0 * t3(1:n,1) .* t3(1:n,1) ) ...
    .* t2(1:n,1) *. t2(1:n,1) *. t4(1:n,1).^5 ...
    .* ( t2(1:n,1) - 2.0 * t4(1:n,1) );

  fy(1:n,1) = ( ( 20.0 / 3.0 ) * t1(1:n,1) ).^2 .* ( ( 20.0 / 3.0 ) * t3(1:n,1) ).^5 ...
    .* ( 2.0 * t2(1:n,1) - 3.0 * t4(1:n,1) - 5.0 + 12.0 * t4(1:n,1) * t4(1:n,1) ) ...
    .* t2(1:n,1) .* t2(1:n,1) .* t4(1:n,1).^5 ...
    .* ( t1(1:n,1) - 2.0 * t3(1:n,1) );

  return
end

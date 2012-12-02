function [ fx, fy ] = f03_f1 ( n, x, y )

%*****************************************************************************80
%
%% F03_F1 returns first derivatives of function 3.
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
  t1(1:n,1) = 5.4 * y(1:n,1);
  t2(1:n,1) = 1.0 + ( 3.0 * x(1:n,1) - 1.0 ).^2;
  fx(1:n,1) = - ( 3.0 * x(1:n,1) - 1.0 ) ...
    .* ( 1.25 + cos ( t1(1:n,1) ) ) ./ ( t2(1:n,1) .* t2(1:n,1) );
  fy(1:n,1) = - 0.9 * sin ( t1(1:n,1) ) ./ t2(1:n,1);

  return
end

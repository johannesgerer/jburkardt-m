function [ fxx, fxy, fyy ] = f07_f2 ( n, x, y )

%*****************************************************************************80
%
%% F07_F2 returns second derivatives of function 7.
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
%    Output, real FXX(N,1), FXY(N,1), FYY(N,1), second derivatives.
%
  t1(1:n,1) = 10.0 * x(1:n,1);
  t2(1:n,1) = 10.0 * y(1:n,1);
  t3(1:n,1) = 10.0 * cos ( 10.0 * x(1:n,1) .* y(1:n,1) );
  t4(1:n,1) = 100.0 * sin ( 10.0 * x(1:n,1) .* y(1:n,1) );

  fxx(1:n,1) = - 200.0 * cos ( t1(1:n,1) ) .* sin ( t2(1:n,1) ) ...
    - t4(1:n,1) .* y(1:n,1) .* y(1:n,1);
  fxy(1:n,1) = - 200.0 * sin ( t1(1:n,1) ) .* cos ( t2(1:n,1) ) ...
    + t3(1:n,1) - t4(1:n,1) .* x(1:n,1) .* y(1:n,1);
  fyy(1:n,1) = - 200.0 * cos ( t1(1:n,1) ) .* sin ( t2(1:n,1) ) ...
    - t4(1:n,1) .* x(1:n,1) .* x(1:n,1);

  return
end

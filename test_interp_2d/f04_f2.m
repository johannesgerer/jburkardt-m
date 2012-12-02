function [ fxx, fxy, fyy ] = f04_f2 ( n, x, y )

%*****************************************************************************80
%
%% F04_F2 returns second derivatives of function 4.
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
  t1(1:n,1) = x(1:n,1) - 0.5;
  t2(1:n,1) = y(1:n,1) - 0.5;
  t3(1:n,1) = - 3.375 ...
    * exp ( - 5.0625 * ( t1(1:n,1) .* t1(1:n,1) + t2(1:n,1) .* t2(1:n,1) ) );

  fxx(1:n,1) = ( 1.0 - 10.125 * t1(1:n,1) .* t1(1:n,1) ) .* t3(1:n,1);
  fxy(1:n,1) = - 10.125 * t1(1:n,1) .* t2(1:n,1) .* t3(1:n,1);
  fyy(1:n,1) = ( 1.0 - 10.125 * t2(1:n,1) .* t2(1:n,1) ) .* t3(1:n,1);

  return
end

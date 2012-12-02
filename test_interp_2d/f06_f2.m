function [ fxx, fxy, fyy ] = f06_f2 ( n, x, y )

%*****************************************************************************80
%
%% F06_F2 returns second derivatives of function 6.
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
  t4(1:n,1) = 64.0 - 81.0 * ( ( x(1:n,1) - 0.5 ).^2 + ( y(1:n,1) - 0.5 ).^2 );

  fxx = zeros ( n );
  fxy = zeros ( n );
  fyy = zeros ( n );

  i = find ( 0 < t4(1:n,1) );

  t1(i,1) = x(i,1) - 0.5;
  t2(i,1) = y(i,1) - 0.5;
  t3(i,1) = - 9.0 ./ sqrt ( t4(i,1) );
  fxx(i,1) = ( 1.0 + t1(i,1) .* t3(i,1) .* t1(i,1) .* t3(i,1) ) .* t3(i,1);
  fxy(i,1) = t1(i,1) .* t3(i,1) .* t2(i,1) .* t3(i,1);
  fyy(i,1) = ( 1.0 + t2(i,1) .* t3(i,1) .* t2(i,1) .* t3(i,1) ) .* t3(i,1);

  return
end

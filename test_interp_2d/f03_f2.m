function [ fxx, fxy, fyy ] = f03_f2 ( n, x, y )

%*****************************************************************************80
%
%% F03_F2 returns second derivatives of function 3.
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
  t1(1:n,1) = 5.4 * y(1:n,1);
  t2(1:n,1) = 1.0 + ( 3.0 * x(1:n,1) - 1.0 ).^2;

  fxx(1:n,1) = 3.0 * ( 1.25 + cos ( t1(1:n,1) ) ) .* ( 3.0 * t2(1:n,1) - 4.0 ) ...
    ./ ( t2(1:n,1).^3 );
  fxy(1:n,1) = 5.4 * ( 3.0 * x(1:n,1) - 1.0 ) .* sin ( t1(1:n,1) ) ...
    ./ ( t2(1:n,1) .* t2(1:n,1) );
  fyy(1:n,1) = - 4.86 * cos ( t1(1:n,1) ) ./ t2(1:n,1);

  return
end

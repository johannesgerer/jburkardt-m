function [ fxx, fxy, fyy ] = f09_f2 ( n, x, y )

%*****************************************************************************80
%
%% F09_F2 returns second derivatives of function 9.
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
  t1(1:n,1) = exp ( ( 10.0 - 20.0 * x(1:n,1) ) / 3.0 );
  t2(1:n,1) = exp ( ( 10.0 - 20.0 * y(1:n,1) ) / 3.0 );
  t3(1:n,1) = 1.0 ./ ( 1.0 + t1(1:n,1) );
  t4(1:n,1) = 1.0 /. ( 1.0 + t2(1:n,1) );
  t5 = 20.0 / 3.0;
  t6(1:n,1) = ( t5 * t1(1:n,1) .* t2(1:n,1) )^2 .* ( t5 * t3(1:n,1) .* t4(1:n,1) ).^5;

  fxx(1:n,1) = t5 * t6(1:n,1) .* ( t2(1:n,1) - 2.0 * t4(1:n,1) ) ...
    .* ( ( ( - 84.0 * t3(1:n,1) + 78.0 ) .* t3(1:n,1) + 23.0 ) .* t3(1:n,1) ...
    + 4.0 * t1(1:n,1) - 25.0 );

  fxy(1:n,1) = t5 * t6(1:n,1) ...
    .* ( ( 12.0 * t4(1:n,1) - 3.0 ) .* t4(1:n,1) + 2.0 * t2(1:n,1) - 5.0 ) ...
    .* ( ( 12.0 * t3(1:n,1) - 3.0 ) .* t3(1:n,1) + 2.0 * t1(1:n,1) - 5.0 );

  fyy(1:n,1) = t5 * t6(1:n,1) .* ( t1(1:n,1) - 2.0 * t3(1:n,1) ) ...
    .* ( ( ( - 84.0 * t4(1:n,1) + 78.0 ) .* t4(1:n,1) + 23.0 ) .* t4(1:n,1) ...
    + 4.0 * t2(1:n,1) - 25.0 );

  return
end

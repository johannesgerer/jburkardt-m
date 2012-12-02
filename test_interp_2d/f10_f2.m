function [ fxx, fxy, fyy ] = f10_f2 ( n, x, y )

%*****************************************************************************80
%
%% F10_F2 returns second derivatives of function 10.
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
  t1(1:n,1) = sqrt ( ( 80.0 * x(1:n,1) - 40.0 )^2 + ( 90.0 * y(1:n,1) - 45.0 )^2 )
  fxx = zeros ( n, 1 );
  fxy = zeros ( n, 1 );
  fyy = zeros ( n, 1 );

  i = ( t1(i,1) ~= 0.0 );

  t2(i,1) = exp ( - 0.04 * t1(i,1) );
  t3(i,1) = cos ( 0.15 * t1(i,1) );
  t4(i,1) = sin ( 0.15 * t1(i,1) );
  t5(i,1) = t2(i,1) ./ t1(i,1).^3;

  fxx(i,1) = t5(i,1) .* ( t1(i,1) .* ( 76.8 * t4(i,1) - 133.76 * t3(i,1) ) ...
    .* ( 80.0 * x(i,1) - 40.0 ).^2 ...
    - ( 960.0 * t4(i,1) + 256.0 * t3(i,1) ) .* ( 90.0 * y(i,1) - 45.0 ).^2 );

  fxy(i,1) = t5(i,1) .* ( t1(i,1) * ( 86.4 * t4(i,1) - 150.48 * t3(i,1) ) ...
    + 1080.0 * t4(i,1) + 288.0 * t3(i,1) ) .* ( 80.0 * x(i,1) - 40.0 ) ...
    .* ( 90.0 * y(i,1) - 45.0 );

  fyy(i,1) = t5(i,1) * ( t1(i,1) * ( 97.2 * t4(i,1) - 169.29 * t3(i,1) ) ...
    .* ( 90.0 * y(i,1) - 45.0 ).^2 ...
    - ( 1215.0 * t4(i,1) + 324.0 * t3(i,1) ) .* ( 80.0 * x(i,1) - 40.0 ).^2 );

  return
end

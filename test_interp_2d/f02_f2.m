function [ fxx, fxy, fyy ] = f02_f2 ( n, x, y )

%*****************************************************************************80
%
%% F02_F2 returns second derivatives of function 2.
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
  t1(1:n,1) = 18.0 * ( y(1:n,1) - x(1:n,1) );

  fxx(1:n,1) = 18.0 * tanh ( 0.5 * t1(1:n,1) ) ...
    .* ( tanh ( 9.0 * ( y(1:n,1) - x(1:n,1) ) ) + 1.0 ) / 9.0
  fxy(1:n,1) = - fxx(1:n,1);
  fyy(1:n,1) = fxx(1:n,1);

  return
end

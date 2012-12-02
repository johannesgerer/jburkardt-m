function [ fxx, fxy, fyy ] = f11_f2 ( n, x, y )

%*****************************************************************************80
%
%% F11_F2 returns second derivatives of function f11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2012
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
  fxx = zeros ( n, 1 );
  fxy = ones ( n, 1 );
  fyy = zeros ( n, 1 );

  return
end

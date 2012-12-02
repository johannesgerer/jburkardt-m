function [ fx, fy ] = f06_f1 ( n, x, y )

%*****************************************************************************80
%
%% F06_F1 returns first derivatives of function 6.
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
  fx = zeros ( n, 1 );
  fy = zeros ( n, 1 );

  t4(1:n,1) = 64.0 - 81.0 * ( ( x(1:n,1) - 0.5 ).^2 + ( y(1:n,1) - 0.5 ).^2 );

  i = ( 0.0 < t4(1:n,1) );

  fx(i,1) = - 9.0 * ( x(i,1) - 0.5 ) ./ sqrt ( t4(i,1) );
  fy(i,1) = - 9.0 * ( y(i,1) - 0.5 ) ./ sqrt ( t4(i,1) );

  return
end

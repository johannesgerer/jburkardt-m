function [ fx, fy ] = f13_f1 ( n, x, y )

%*****************************************************************************80
%
%% F13_F1 returns first derivatives of function f13.
%
%  Discussion:
%
%    Currently, the derivative information is of no interest to me.
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
%    Output, real FX(N,1), FY(N,1), the derivative values.
%
  fx(1:n,1) = zeros ( n, 1 );
  fy(1:n,1) = zeros ( n, 1 );

  return
end

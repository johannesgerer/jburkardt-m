function h = p34_h ( n, x )

%*****************************************************************************80
%
%% P34_H evaluates the Hessian for problem 34.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  h(1,1) = 8.0 - 25.2 * x(1)^2 + 10.0 * x(1)^4;
  h(1,2) = 1.0;
  h(2,1) = 1.0;
  h(2,2) = -8.0 + 48.0 * x(2)^2;

  return
end

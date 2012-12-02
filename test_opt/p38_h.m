function h = p38_h ( n, x )

%*****************************************************************************80
%
%% P38_H evaluates the Hessian for problem 38.
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

  h(1,1) = 2.0 + 2.7 * pi^2 * cos ( 3.0 * pi * x(1) );
  h(1,2) = 0.0;

  h(2,1) = 0.0;
  h(2,2) = 4.0 + 6.4 * pi^2 * cos ( 4.0 * pi * x(2) );

  return
end

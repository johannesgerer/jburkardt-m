function h = p23_h ( n, x )

%*****************************************************************************80
%
%% P23_H evaluates the Hessian for problem 23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2000
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

  h(1,1) = 1200.0 * x(1) * x(1) - 400.0 * x(2) + 2.0;
  h(1,2) = - 400.0 * x(1);
  h(2,1) = -400.0 * x(1);
  h(2,2) = 200.0;

  return
end

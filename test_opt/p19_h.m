function h = p19_h ( n, x )

%*****************************************************************************80
%
%% P19_H evaluates the Hessian for problem 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2000
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

  h(1,1) = - 1200.0 * x(1) * x(2) + 3000.0 * x(1)^4 + 2.0;
  h(1,2) = - 600.0 * x(1) * x(1);

  h(2,1) = - 600.0 * x(1) * x(1);
  h(2,2) = 200.0;

  return
end

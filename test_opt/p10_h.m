function h = p10_h ( n, x )

%*****************************************************************************80
%
%% P10_H evaluates the Hessian for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
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

  h(1,1) = 2.0 + 2.0 * x(2) * x(2);
  h(1,2) = 4.0 * x(1) * x(2) - 4.0;

  h(2,1) = 4.0 * x(1) * x(2) - 4.0;
  h(2,2) = 2.0 + 2.0 * x(1) * x(1);

  return
end

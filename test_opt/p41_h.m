function h = p41_h ( n, x )

%*****************************************************************************80
%
%% P41_H evaluates the Hessian for problem 41.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
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

  h(1,1) = 1200.0 * x(1)^2 - 400.0 * x(2) + 2.0;
  h(1,2) = - 400.0 * x(1);

  h(2,1) = -400.0 * x(1);
  h(2,2) = 220.2;
  h(2,4) = 19.8;

  h(3,3) = -360.0 * x(4) + 1080.0 * x(3)^2 + 2.0;
  h(3,4) = - 360.0 * x(3);

  h(4,2) = 19.8;
  h(4,3) = - 360.0 * x(3);
  h(4,4) = 200.2;

  return
end

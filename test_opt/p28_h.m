function h = p28_h ( n, x )

%*****************************************************************************80
%
%% P28_H evaluates the Hessian for problem 28.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2001
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

  r = sqrt ( x(1)^2 + x(2)^2 );

  rx1 = x(1) / r;
  rx2 = x(2) / r;

  rx1x1 = x(2)^2 / r^3;
  rx1x2 = - x(1) * x(2) / r^3;
  rx2x1 = - x(1) * x(2) / r^3;
  rx2x2 = x(1)^2 / r^3;
%
%  F = A * B
%  dFdX1 = ( Ar * B + A * Br ) * Rx1
%  d2FdX1dX1 = ( Arr * B + Ar * Br ) * Rx1^2 + ( Ar * B + A * Br ) * Rx1x1
%  etc
%
  a = sqrt ( r );
  ar = 0.5 / sqrt ( r );
  arr = - 0.25 / sqrt ( r^3 );

  b = 1.0 + ( sin ( 50.0 * r^0.2 ) )^2;
  br = 10.0 * sin ( 100.0 * r^0.2 ) * r^(-0.8);
  brr = 200.0 * cos ( 100.0 * r^0.2 ) * r^(-1.6) ...
    - 10.0 * sin ( 100.0 * r^0.2 ) * 0.8 * r^(-1.8);

  h(1,1) = ( arr * b + 2.0 * ar * br + a * brr ) * rx1 * rx1 ...
    + ( ar * b + a * br ) * rx1x1;

  h(1,2) = ( arr * b + 2.0 * ar * br + a * brr ) * rx1 * rx2 ...
    + ( ar * b + a * br ) * rx1x2;

  h(2,1) = ( arr * b + 2.0 * ar * br + a * brr ) * rx2 * rx1 ...
    + ( ar * b + a * br ) * rx2x1;

  h(2,2) = ( arr * b + 2.0 * ar * br + a * brr ) * rx2 * rx2 ...
    + ( ar * b + a * br ) * rx2x2;

  return
end

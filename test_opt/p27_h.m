function h = p27_h ( n, x )

%*****************************************************************************80
%
%% P27_H evaluates the Hessian for problem 27.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2001
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

  if ( r == 0.0 )
    h(1,1) = 1.0;
    h(1,2) = 0.0;
    h(2,1) = 0.0;
    h(2,2) = 1.0;
    return
  end

  rx1 = x(1) / r;
  rx2 = x(2) / r;

  rx1x1 = x(2)^2 / r^3;
  rx1x2 = - x(1) * x(2) / r^3;
  rx2x1 = - x(1) * x(2) / r^3;
  rx2x2 = x(1)^2 / r^3;

  a = ( 1.0 + 0.001 * r^2 )^( -2 );
  ar = - 0.004 * r * ( 1.0 + 0.001 * r^2 )^( -3 );
  arr = - 0.004 * ( 1.0 + 0.001 * r^2 )^( -3 ) ...
    + 0.000024 * r * ( 1.0 + 0.001 * r^2 )^( -4 );

  b = ( sin ( r ) )^2 - 0.5;
  br = sin ( 2.0 * r );
  brr = 2.0 * cos ( 2.0 * r );

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

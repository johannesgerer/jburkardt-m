function g = p27_g ( n, x )

%*****************************************************************************80
%
%% P27_G evaluates the gradient for problem 27.
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
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  r = sqrt ( x(1)^2 + x(2)^2 );

  if ( r == 0.0 )
    g(1) = 0.0;
    g(2) = 0.0;
    return
  end

  rx1 = x(1) / r;
  rx2 = x(2) / r;

  a = ( 1.0 + 0.001 * r^2 )^( -2 );
  ar = - 0.004 * r * ( 1.0 + 0.001 * r^2 )^( -3 );

  b = ( sin ( r ) )^2 - 0.5;
  br = sin ( 2.0 * r );

  g(1) = ( ar * b + a * br ) * rx1;
  g(2) = ( ar * b + a * br ) * rx2;

  return
end

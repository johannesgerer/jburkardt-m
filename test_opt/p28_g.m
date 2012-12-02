function g = p28_g ( n, x )

%*****************************************************************************80
%
%% P28_G evaluates the gradient for problem 28.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2001
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

  a = sqrt ( r );
  ar = 0.5 / sqrt ( r );

  b = 1.0 + ( sin ( 50.0 * r^0.2 ) )^2;
  br = 10.0 * sin ( 100.0 * r^0.2 ) * r^(-0.8);

  rx1 = x(1) / r;
  rx2 = x(2) / r;

  g(1) = ( ar * b + a * br ) * rx1;
  g(2) = ( ar * b + a * br ) * rx2;

  return
end

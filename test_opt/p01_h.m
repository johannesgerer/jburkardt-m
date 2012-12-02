function h = p01_h ( n, x )

%*****************************************************************************80
%
%% P01_H evaluates the Hessian for problem 1.
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
  th = p01_th ( x );

  h = zeros ( 3, 3 );

  h(1,1) = 200.0 - 200.0 * x(2)^2 ...
         * ( 1.0 / sqrt ( x(1)^2 + x(2)^2 )^3 ...
         - 25.0 / ( pi * ( x(1)^2 + x(2)^2 ) )^2 ) ...
         - 2000.0 * x(1) * x(2) * ( x(3) - 10.0 * th ) ...
         / ( pi * ( x(1)^2 + x(2)^2 )^2 );

  h(1,2) = 200.0 * x(1) * x(2) / sqrt ( x(1)^2 + x(2)^2 )^3 ...
         + 1000.0 / ( pi * ( x(1)^2 + x(2)^2 )^2 ) ...
         * ( ( x(3) - 10.0 * th ) * ( x(1)^2 - x(2)^2 ) ...
         - 5.0 * x(1) * x(2) / pi );

  h(1,3) = 1000.0 * x(2) / ( pi * ( x(1)^2 + x(2)^2 ) );

  h(2,1) = 200.0 * x(1) * x(2) / sqrt ( x(1)^2 + x(2)^2 )^3 ...
         + 1000.0 / ( pi * ( x(1)^2 + x(2)^2 )^2 ) ...
         * ( ( x(3) - 10.0 * th ) * ( x(1)^2 - x(2)^2 ) ...
         - 5.0 * x(1) * x(2) / pi );

  h(2,2) = 200.0 - 200.0 * x(1)^2 ...
         * ( 1.0 / sqrt ( x(1)^2 + x(2)^2 )^3 ...
         - 25.0 / ( pi * ( x(1)^2 + x(2)^2 ) )^2 ) ...
         + 2000.0 * x(1) * x(2) * ( x(3) - 10.0 * th ) ...
         / ( pi * ( x(1)^2 + x(2)^2 )^2 );

  h(2,3) = - 1000.0 * x(1) / ( pi * ( x(1)^2 + x(2)^2 ) );

  h(3,1) = 1000.0 * x(2) / ( pi * ( x(1)^2 + x(2)^2 ) );
  h(3,2) = - 1000.0 * x(1) / ( pi * ( x(1)^2 + x(2)^2 ) );
  h(3,3) = 202.0;

  return
end

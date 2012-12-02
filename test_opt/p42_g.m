function g = p42_g ( n, x )

%*****************************************************************************80
%
%% P42_G evaluates the gradient for problem 42.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2002
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

  g(1) = 2.0 * ( x(1) - x(2) ) / ( 1.0 + ( x(1) - x(2) )^2 )^2;

  g(2) = 2.0 * ( x(2) - x(1) ) / ( 1.0 + ( x(1) - x(2) )^2 )^2 ...
    - 0.5 * pi * x(3) * cos ( 0.5 * pi * x(2) * x(3) );

  g(3) = - 0.5 * pi * x(2) * cos ( 0.5 * pi * x(2) * x(3) );

  if ( x(2) ~= 0.0 )

    arg = ( x(1) + 2.0 * x(2) + x(3) ) / x(2);
    term = exp ( - arg^2 );

    g(1) = g(1) + 2.0 * term * ( x(1) + 2.0 * x(2) + x(3) ) / x(2)^2;
    g(2) = g(2) - 2.0 * term * ( x(1) + 2.0 * x(2) + x(3) ) ...
      * ( x(1) + x(3) ) / x(2)^3;
    g(3) = g(3) + 2.0 * term * ( x(1) + 2.0 * x(2) + x(3) ) / x(2)^2;

  end

  return
end

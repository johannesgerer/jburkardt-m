function g = p02_g ( n, x )

%*****************************************************************************80
%
%% P02_G evaluates the gradient for problem 2.
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
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  for i = 1 : 13

    c = - i / 10.0;

    fi =        x(3) * exp ( c * x(1) )         - x(4) * exp ( c * x(2) ) ...
          +     x(6) * exp ( c * x(5) )         -        exp ( c ) ...
          +  5.0 * exp ( 10.0 * c ) -  3.0 * exp ( 4.0 * c );

    dfdx1 =     c    * x(3) * exp ( c * x(1) );
    dfdx2 =   - c    * x(4) * exp ( c * x(2) );
    dfdx3 =                   exp ( c * x(1) );
    dfdx4 =   -               exp ( c * x(2) );
    dfdx5 =     c    * x(6) * exp ( c * x(5) );
    dfdx6 =                   exp ( c * x(5) );

    g(1) = g(1) + 2.0 * fi * dfdx1;
    g(2) = g(2) + 2.0 * fi * dfdx2;
    g(3) = g(3) + 2.0 * fi * dfdx3;
    g(4) = g(4) + 2.0 * fi * dfdx4;
    g(5) = g(5) + 2.0 * fi * dfdx5;
    g(6) = g(6) + 2.0 * fi * dfdx6;

  end

  return
end

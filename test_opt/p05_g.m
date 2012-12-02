function g = p05_g ( n, x )

%*****************************************************************************80
%
%% P05_G evaluates the gradient for problem 5.
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

  for i = 1 : 10

    c = - i / 10.0;

    fi = exp ( c * x(1) ) - exp ( c * x(2) ) ...
      - x(3) * ( exp ( c ) - exp ( 10.0 * c ) );

    dfidx1 =   c * exp ( c * x(1) );
    dfidx2 = - c * exp ( c * x(2) );
    dfidx3 = - ( exp ( c ) - exp ( 10.0 * c ) );

    g(1) = g(1) + 2.0 * fi * dfidx1;
    g(2) = g(2) + 2.0 * fi * dfidx2;
    g(3) = g(3) + 2.0 * fi * dfidx3;

  end

  return
end

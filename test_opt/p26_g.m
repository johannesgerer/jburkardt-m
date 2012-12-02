function g = p26_g ( n, x )

%*****************************************************************************80
%
%% P26_G evaluates the gradient for problem 26.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2001
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

  jroot = 5;
  k = 500;
  fi = k;
  dfidx1 = 0.0;
  dfidx2 = 0.0;

  for j = 1 : jroot * jroot

    j1 = mod ( j-1, jroot ) + 1;
    a1 = -32 + j1 * 16;

    j2 = ( j - 1 ) / jroot;
    a2 = -32 + j2 * 16;

    fj = ( j + ( x(1) - a1 )^6 + ( x(2) - a2 )^6 );

    fi = fi + 1.0 / fj;

    dfidx1 = dfidx1 - ( 1.0 / fj^2 ) * 6.0 * ( x(1) - a1 )^5;
    dfidx2 = dfidx2 - ( 1.0 / fj^2 ) * 6.0 * ( x(2) - a2 )^5;

  end

  g(1) = - ( 1.0 / fi^2 ) * dfidx1;
  g(2) = - ( 1.0 / fi^2 ) * dfidx2;

  return
end

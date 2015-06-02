function [ f, g, h ] = rhs_lucas ( nu, rho, n, x, y, t )

%*****************************************************************************80
%
%% RHS_LUCAS evaluates the right hand side of Lucas Bystricky's problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real NU, the kinematic viscosity.
%
%    Input, real RHO, the fluid density.
%
%    Input, integer N, the number of nodes.
%
%    Input, real X(N), Y(N), the coordinates of nodes.
%
%    Input, real T, the current time.
%
%    Output, real F(N), G(N), H(N), the right hand sides.
%
  u = - cos ( pi * x ) / pi;
  dudt = zeros ( n, 1 );
  dudx = sin ( pi * x );
  dudxx = pi * cos ( pi * x );
  dudy = zeros ( n, 1 );
  dudyy = zeros ( n, 1 );

  v = - y .* sin ( pi * x );
  dvdt = zeros ( n, 1 );
  dvdx = - pi * y .* cos ( pi * x );
  dvdxx = + pi * pi * y .* sin ( pi * x );
  dvdy = - sin ( pi * x );
  dvdyy = zeros ( n, 1 );

  p = zeros ( n, 1 );
  dpdx = zeros ( n, 1 );
  dpdy = zeros ( n, 1 );

  f = dudt - nu * ( dudxx + dudyy ) + u .* dudx + v .* dudy + dpdx / rho;
  g = dvdt - nu * ( dvdxx + dvdyy ) + u .* dvdx + v .* dvdy + dpdy / rho;
  h = dudx + dvdy;

  return
end

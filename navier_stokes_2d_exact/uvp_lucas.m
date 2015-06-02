function [ u, v, p ] = uvp_lucas ( nu, rho, n, x, y, t )

%*****************************************************************************80
%
%% UVP_LUCAS evaluates Lucas Bystricky's exact Navier Stokes solution.
%
%  Discussion:
%
%    There is no time dependence.
%
%    The pressure is 0.
%
%    The preferred domain is the unit square.
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
%    Output, real U(N), V(N), the X and Y velocity.
%
%    Output, real P(N), the pressure.
%
  u = - cos ( pi * x ) / pi;
  v = - y .* sin ( pi * x );
  p = zeros ( n, 1 );

  return
end


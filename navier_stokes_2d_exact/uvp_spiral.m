function [ u, v, p ] = uvp_spiral ( nu, rho, n, x, y, t )

%*****************************************************************************80
%
%% UVP_SPIRAL returns velocity and pressure for the spiral flow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Maxim Olshanskii, Leo Rebholz,
%    Application of barycenter refined meshes in linear elasticity
%    and incompressible fluid dynamics,
%    ETNA: Electronic Transactions in Numerical Analysis, 
%    Volume 38, pages 258-274, 2011.
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
  u = ( 1.0 + nu * t ) * 2.0 ...
    * x.^2 .* ( x - 1.0 ).^2 ...
    .* y .* ( 2.0 * y - 1.0 ) .* ( y - 1.0 );

  v = - ( 1.0 + nu * t ) * 2.0 ...
    * x .* ( 2.0 * x - 1.0 ) .* ( x - 1.0 ) ...
    .* y.^2 .* ( y - 1.0 ).^2;

  p = rho * y;

  return
end


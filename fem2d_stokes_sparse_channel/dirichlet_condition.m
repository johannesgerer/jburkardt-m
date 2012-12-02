function [ u_bc, v_bc, p_bc ] = dirichlet_condition ( n, xy )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%
%                           U = 0  V = 0
%
%                       1 +---------------+
%                         |               |
%                         |               |
%           U = Y*(1-Y)   |               | U = Y*(1-Y)
%           V = 0         |               | V = 0
%                         |               |
%                         |               |
%                         |               |
%                       0 +---------------+
%
%                         0               3
%
%                            U = V = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real XY(2,N), the coordinates of the points.
%
%    Output, real U_BC(N), V_BC(N), P_BC(N), the values of the
%    Dirichlet boundary conditions on horizontal velocity, vertical velocity,
%    and pressure, at the points.
%  
  u_bc(1:n) = xy(2,1:n) .* ( 1.0 - xy(2,1:n) );
  v_bc(1:n) = 0.0;
  p_bc(1:n) = 0.0;

  return
end

function [ u_rhs, v_rhs, p_rhs ] = rhs ( n, xy )

%*****************************************************************************80
%
%% RHS gives the right-hand side of the differential equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2006
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
%    Output, real U_RHS(N), V_RHS(N), P_RHS(N), the right
%    hand sides of the differential equations at the points.
%
  p_rhs(1:n) = 0.0;
  u_rhs(1:n) = 0.0;
  v_rhs(1:n) = 0.0;

  return
end

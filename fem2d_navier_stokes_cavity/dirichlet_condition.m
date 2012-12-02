function [ u_bc, v_bc, p_bc ] = dirichlet_condition ( n, xy )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%
%                           U = 1  V = 0
%
%                       1 +---------------+
%                         |               |
%                         |               |
%                         |               |
%            U = V = 0    |               | U = V = 0
%                         |               |
%                         |               |
%                         |               |
%                       0 +---------------+
%
%                         0               1
%
%                            U = V = 0
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
%    Output, real U_BC(N), V_BC(N), P_BC(N), the values of the
%    Dirichlet boundary conditions on horizontal velocity, vertical velocity,
%    and pressure at the points.
%
  tol = 0.0001;

  for i = 1 : n

    x = xy(1,i);
    y = xy(2,i);

    if ( abs ( y - 1.0 ) <= tol )
      u_bc(i) = 1.0;
    else
      u_bc(i) = 0.0;
    end

    v_bc(i) = 0.0;
    p_bc(i) = 0.0;

  end

  return
end

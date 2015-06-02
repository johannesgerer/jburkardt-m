function U = burgers ( ic_function, nx, nt, t_max, nu, bc )

%*****************************************************************************80
%
%% BURGERS_TIME_VISCOUS solves the time-dependent viscous Burgers equation.
%
%  Discussion:
%
%    The space interval is taken to be -1.0 <= x <= +1.0.
%
%    The time interval is taken to be 0 <= t <= t_max.
%
%    A correction to the treatment of the U'' condition was suggested
%    by Hugo Tadashi, 05 December 2014.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 December 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, function UI = IC_FUNCTION ( X ), a handle to the initial 
%    condition function.
%
%    Input, integer NX, the number of nodes.
%
%    Input, integer NT, the number of time steps.
%
%    Input, real T_MAX, the maximum time.
%
%    Input, real NU, the viscosity.
%
%    Input, integer BC, defines the boundary conditions.
%    0, Dirichlet at A, Dirichlet at B.
%    1, Dirichlet at A, U''= 0 at B.
%    2, U'' = 0 at A, Dirichlet at B.
%    3, U'' = 0 at A, U'' = 0 at B.
%    4, Periodic, U(A) = U(B).
%
%    Output, real U(NT+1,NX), the solution at each time and node.
%

%
%  Spatial discretization.
%
  a = -1.0;
  b = +1.0;
  dx = ( b - a ) / nx;
  x = linspace ( a, b, nx );
%
%  Time discretization.
%
  dt = t_max / nt;
%
%  Set up the initial solution values.
%
  U = zeros ( nt + 1, nx );
  u = zeros ( 1, nx );
  unew = zeros ( 1, nx );

  u = ic_function ( x );
  U(1,:) = u(:);
%
%  Time integration.
%
  for i = 1 : nt
%
%  First node.
%
    if ( bc == 0 || bc == 1 )
      unew(1) = u(1);
    elseif ( bc == 2 || bc == 3 )
      ul = 2.0 * u(1) - u(2);
      unew(1) =                  u(1) + dt * ( ...
        nu    * (   u(2) - 2.0 * u(1) + ul    ) / dx^2 ...
        -       ( f(u(2))           - f(ul)   ) / dx );
    elseif ( bc == 4 )
      unew(1) =                  u(1) + dt * ( ...
        nu    * (   u(2) - 2.0 * u(1) + u(nx)  ) / dx^2 ...
        - 0.5 * ( f(u(2))           - f(u(nx)) ) / dx );
    end
%
%  Interior nodes.
%
    unew(2:nx-1) =                u(2:nx-1) + dt * ( ...
      nu    * (   u(3:nx) - 2.0 * u(2:nx-1) + u(1:nx-2)  ) / dx^2 ...
      - 0.5 * ( f(u(3:nx))                - f(u(1:nx-2)) ) / dx );
%
%  Last node.
%
    if ( bc == 0 || bc == 2)
      unew(nx) = u(nx);
    elseif ( bc == 1 || bc == 3 )
      ur = 2.0 * u(nx) - u(nx-1);
      unew(nx) =               u(nx) + dt * ( ...
        nu    * (   ur - 2.0 * u(nx) + u(nx-1)  ) / dx^2 ...
        -       ( f(ur)            - f(u(nx-1)) ) / dx );
    elseif ( bc == 4 )
      unew(nx) =                 u(nx) + dt * ( ...
        nu    * (   u(1) - 2.0 * u(nx) + u(nx-1)  ) / dx^2 ...
        - 0.5 * ( f(u(1))            - f(u(nx-1)) ) / dx );
    end

    u = unew;
    U(i+1,:) = u(:);

  end

  return
end
function value = f ( u )

%*****************************************************************************80
%
%% F evaluates the conservation quantity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real U(*), the current solution value.
%
%    Output, real F(*), the conservation quantity.
%
  value = 0.5 * u.^2;

  return
end

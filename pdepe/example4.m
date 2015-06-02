function example4 ( )

%*****************************************************************************80
%
%% EXAMPLE4 demonstrates the use of PDEPE on a variable coefficient PDE system.
%
%  Discussion:
%
%    Solve the system of convection-diffusion equations.
%
%    PDE: 
%      ut - 2 ux -   vx = uxx
%      vt -   ux - 2 vx - ( 3 (ubar(x))^2 u ) = vxx
%    BC:
%      u(t,-oo) = u(t,+oo) = 0
%      v(t,-oo) = v(t,+oo) = 0
%    IC:
%      u(0,x) = exp ( - (x-5)^2 )
%      v(0,x) = exp ( - (x+5)^2 )
%
%    Here, ubar(x) is the first component in the solution of the boundary value
%    problem:
%
%      ubarx = - 2 ( ubar + 2 ) - vbar
%      vbarx = - ( ubar + 2 ) - 2 vbar - ( ubar^3 + 8 )
%      ubar(-oo) = -2, ubar(+oo) = 1
%      vbar(-oo) = 0, vbar(+00) = -6
%
%    Although the mathematical problem has boundary conditions at infinity,
%    we approximate this by the interval [-25,+25].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2013
%
%  Author:
%
%    Original formulation by P Howard.
%    This version by John Burkardt.
%
%  Reference:
%
%    P Howard,
%    Partial Differential Equations in Matlab 7.0,
%    Spring 2005.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE4:\n' );
  fprintf ( 1, '  A convection-diffusion system:\n' );
  fprintf ( 1, '  ut - 2 ux -   vx = uxx\n' );
  fprintf ( 1, '  vt -   ux - 2 vx - ( 3 (ubar(x))^2 u ) = vxx\n' );
  fprintf ( 1, '  u(t,-oo) = u(t,+oo) = 0\n' );
  fprintf ( 1, '  v(t,-oo) = v(t,+oo) = 0\n' );
  fprintf ( 1, '  u(0,x) = exp ( - (x-5)^2 )\n' );
  fprintf ( 1, '  v(0,x) = exp ( - (x+5)^2 )\n' );
%
%  M defines the coordinate system:
%  0: cartesian
%  1: cylindrical
%  2: spherical
%
  m = 0;
%
%  Define the spatial mesh.
%
  nx = 101;
  xmesh = linspace ( -25.0, +25.0, nx );
%
%  Define the time mesh.
%
  nt = 21;
  tspan = linspace ( 0.0, 2.0, nt );
%
%  Call PDEPE() for the solution.
%
  sol = pdepe ( m, @pdefun, @icfun, @bcfun, xmesh, tspan );
%
%  Copy out the two components of the solution.
%
  u = sol(:,:,1);
  v = sol(:,:,2);

  figure ( 1 )
  subplot(2,1,1)
  surf ( xmesh, tspan, u, 'EdgeColor', 'None' );
  title ( 'Example 4: Solution U Over Time', 'Fontsize', 16 );
  xlabel ( '<--- X --->' )
  ylabel ( '<--- T --->' );
  zlabel ( '<---U(X,T)--->' );
  subplot(2,1,2)
  surf ( xmesh, tspan, v, 'EdgeColor', 'None' );
  title ( 'Example 4: Solution V Over Time', 'Fontsize', 16 );
  xlabel ( '<--- X --->' )
  ylabel ( '<--- T --->' );
  zlabel ( '<---V(X,T)--->' );
  filename = 'example4.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved solution plot in file "%s"\n', filename );
%
%  Plot the initial condition, U at time 0.
%
  figure ( 2 )
  subplot(2,1,1)
  plot ( xmesh, u(1,:), 'LineWidth', 3 );
  grid on
  title ( 'Example 4: Initial Condition U(X,0)', 'Fontsize', 16 );
  xlabel ( '<--- X --->' )
  ylabel ( '<--- U(X,T0) --->' );
  subplot(2,1,2)
  plot ( xmesh, v(1,:), 'LineWidth', 3 );
  grid on
  title ( 'Example 4: Initial Condition V(X,0)', 'Fontsize', 16 );
  xlabel ( '<--- X --->' )
  ylabel ( '<--- V(X,T0) --->' );
  filename = 'example4_ic.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Saved initial condition plot in file "%s"\n', filename );
%
%  Plot the solution at a fixed point, with time varying.
%
  mid = ( nx + 1 ) / 2;

  figure ( 3 )
  subplot(2,1,1)
  plot ( tspan, u(:,mid), 'LineWidth', 3 );
  grid on
  title ( 'Example 4: Time evolution of U(0,T)', 'Fontsize', 16 );
  xlabel ( '<--- T --->' )
  ylabel ( '<--- U(0.0,T) --->' );
  subplot(2,1,2)
  plot ( tspan, v(:,mid), 'LineWidth', 3 );
  grid on
  title ( 'Example 4: Time evolution of V(0,T)', 'Fontsize', 16 );
  xlabel ( '<--- T --->' )
  ylabel ( '<--- V(0.0,T) --->' );
  filename = 'example4_profile.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Saved time evolution plot in file "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE4:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function xprime = degode ( t, x )

%*****************************************************************************80
%
%% DEGODE stores an ODE for a standing wave.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T, the current time.
%
%    Input, real X, the spatial location.
%
%    Output, real XPRIME(2,1), the right hand side of the differential
%    equation satisfied by ( UBAR, VBAR ).
%
  xprime(1,1) =  - 2.0 * ( x(1) + 2.0 ) - x(2);
  xprime(2,1) = - ( x(1) + 2.0 ) - 2.0 * x(2) - ( x(1)^3 + 8.0 );

  return
end
function ubar = pdegwave ( x )

%*****************************************************************************80
%
%% PDEGWAVE determines the value of UBAR in the equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the spatial location.
%
%    Output, real UBAR, the value of UBAR at X.
%
  small = 0.000001;

  if ( x < -20.0 )
    ubar = -2.0;
    vbar = 0.0;
  else
    tspan = [ -20, x ];
    x0 = [ -2.0 + small, - small ];
    [ t, x ] = ode45 ( @degode, tspan, x0 );
    ubar = x(end,1);
    vbar = x(end,2);
  end

  return
end
function [ c, f, s ] = pdefun ( x, t, u, dudx )

%*****************************************************************************80
%
%% PDEFUN defines the components of the PDE.
%
%  Discussion:
%
%    The PDE has the form:
%
%      c * du/dt = x^(-m) d/dx ( x^m f ) + s
%
%    where m is 0, 1 or 2,
%    c, f and s are functions of x, t, u, and dudx, 
%    and most typically, f = dudx.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the spatial location.
%
%    Input, real T, the current time.
%
%    Input, real U(:,1), the estimated solution at T and X.
%
%    Input, real DUDX(:,1), the estimated spatial derivative of U at T and X.
%
%    Output, real C(:,1), the coefficients of du/dt.
%
%    Output, real F(:,1), the flux terms.
%
%    Output, real S(:,1), the source terms.
%
  c = [ 1.0; 1.0 ];
  ubar = pdegwave ( x );
  f(1) = dudx(1) + 2.0 * u(1) + u(2);
  f(2) = dudx(2) + u(1) + 2.0 * u(2) + 3.0 * ubar^2 * u(1);
  s = [ 0.0; 0.0 ];

  return
end
function u0 = icfun ( x )

%*****************************************************************************80
%
%% ICFUN defines the initial conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the spatial location.
%
%    Output, real U0(:,1), the value of the solution at the initial time, 
%    and location X.
%
  u0(1) = exp ( - ( x - 5.0 )^2 );
  u0(2) = exp ( - ( x + 5.0 )^2 );

  return
end
function [ pl, ql, pr, qr ] = bcfun ( xl, ul, xr, ur, t )

%*****************************************************************************80
%
%% BCFUN defines the boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XL, the spatial coordinate of the left boundary.
%
%    Input, real UL(:,1), the solution estimate at the left boundary.
%
%    Input, real XR, the spatial coordinate of the right boundary.
%
%    Input, real UR(:,1), the solution estimate at the right boundary.
%
%    Output, real PL(:,1), the Dirichlet portion of the left boundary condition.
%
%    Output, real QL(:,1), the coefficient of the flux portion of the left 
%    boundary condition.
%
%    Output, real PR(:,1), the Dirichlet portion of the right boundary condition.
%
%    Output, real QR(:,1), the coefficient of the flux portion of the right 
%    boundary condition.
%
  pl = [ ul(1); ul(2) ];
  ql = [ 0.0; 0.0 ];
  pr = [ ur(1); ur(2) ];
  qr = [ 0.0; 0.0 ];

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end

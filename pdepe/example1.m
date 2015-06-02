function example1 ( )

%*****************************************************************************80
%
%% EXAMPLE1 demonstrates the use of PDEPE on a scalar PDE.
%
%  Discussion:
%
%    Solve the heat equation.
%
%    PDE: 
%      ut = uxx
%    BC:
%      u(t,0) = 0, u(t,1) = 1
%    IC:
%      u(0,x) = 2x/(1+x^2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2013
%
%  Author:
%
%    Original formulation by P Howard, 2005.
%    This version by John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE1:\n' );
  fprintf ( 1, '  The heat equation.\n' );
  fprintf ( 1, '  ut = uxx\n' );
  fprintf ( 1, '  u(t,0) = 0, u(t,1) = 1\n' );
  fprintf ( 1, '  u(0,x) = 2x/(1+x^2)\n' );
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
  nx = 21;
  xmesh = linspace ( 0.0, 1.0, nx );
%
%  Define the time mesh.
%
  nt = 11;
  tspan = linspace ( 0.0, 2.0, nt );
%
%  Call PDEPE() for the solution.
%
  sol = pdepe ( m, @pdefun, @icfun, @bcfun, xmesh, tspan );
%
%  Even though our solution is "really" a 2D array, PDEPE stores it
%  in a 3D array SOL(:,:,:).  The surf() command needs a 2D array to plot,
%  so let's copy U out of SOL.
%
  u = sol(:,:,1);

  figure ( 1 )
  surf ( xmesh, tspan, u );
  title ( 'Example 1: Solution Over Time', 'Fontsize', 16 );
  xlabel ( '<--- X --->' )
  ylabel ( '<--- T --->' );
  zlabel ( '<---U(X,T)--->' );
  filename = 'example1.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved solution plot in file "%s"\n', filename );
%
%  Plot the initial condition, U at time 0.
%
  figure ( 2 )
  plot ( xmesh, u(1,:), 'LineWidth', 3 );
  grid on
  title ( 'Example 1: Initial Condition', 'Fontsize', 16 );
  xlabel ( '<--- X --->' )
  ylabel ( '<--- U(X,T0) --->' );
  filename = 'example1_ic.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Saved initial condition plot in file "%s"\n', filename );
%
%  Plot the solution U at a fixed point, with time varying.
%
  figure ( 3 )
  mid = 1 + floor ( ( nx - 1 ) / 2 );
  plot ( tspan, u(:,mid), 'LineWidth', 3 );
  grid on
  title ( 'Example 1: Time evolution of solution at midpoint', 'Fontsize', 16 );
  xlabel ( '<--- T --->' )
  ylabel ( '<--- U(0.5,T) --->' );
  filename = 'example1_profile.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Saved time evolution plot in file "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE1:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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
%    29 August 2013
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
  c = 1.0;
  f = dudx;
  s = 0.0;

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
%    29 August 2013
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
  u0 = 2.0 * x ./ ( 1.0 + x.^2 );

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
%    29 August 2013
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
  pl = ul;
  ql = 0.0;
  pr = ur - 1.0;
  qr = 0.0;

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

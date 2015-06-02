function uvp_taylor_test2 ( )

%*****************************************************************************80
%
%% UVP_TAYLOR_TEST2 samples the solution on the boundary at the initial time.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/uvp_taylor_test2.m
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
  r8_lo = 0.5;
  r8_hi = 2.5;

  nu = 1.0;
  rho = 1.0;
  t = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UVP_TAYLOR_TEST2\n' );
  fprintf ( 1, '  Taylor Vortex Flow:\n' );
  fprintf ( 1, '  Estimate the range of velocity and pressure\n' );
  fprintf ( 1, '  on the boundary\n' );
  fprintf ( 1, '  at the initial time T = 0, using a region that is \n' );
  fprintf ( 1, '  the square centered at (1.5,1.5) with "radius" 1.0,\n' );
  fprintf ( 1, '  Kinematic viscosity NU = %g\n', nu );
  fprintf ( 1, '  Fluid density RHO = %g\n', rho );

  n = 400;
  x = zeros ( n, 1 );
  y = zeros ( n, 1 );

  x(1:100,1) = linspace ( r8_lo, r8_hi, 100 );
  y(1:100,1) = r8_lo;

  x(101:200,1) = r8_hi;
  y(101:200,1) = linspace ( r8_lo, r8_hi, 100 );

  x(201:300,1) = linspace ( r8_hi, r8_lo, 100 );
  y(201:300,1) = r8_hi;

  x(301:400,1) = r8_lo;
  y(301:400,1) = linspace ( r8_lo, r8_hi, 100 );

  [ u, v, p ] = uvp_taylor ( nu, rho, n, x, y, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  U:  %14.6g  %14.6g\n', min ( u ), max ( u ) );
  fprintf ( 1, '  V:  %14.6g  %14.6g\n', min ( v ), max ( v ) );
  fprintf ( 1, '  P:  %14.6g  %14.6g\n', min ( p ), max ( p ) );

  return
end

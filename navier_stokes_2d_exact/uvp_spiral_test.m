function uvp_spiral_test ( )

%*****************************************************************************80
%
%% UVP_SPIRAL_TEST samples the Spiral Flow solution at the initial time.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/uvp_spiral_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2015
%
%  Author:
%
%    John Burkardt
%
  nu = 1.0;
  rho = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UVP_SPIRAL_TEST\n' );
  fprintf ( 1, '  Spiral Flow:\n' );
  fprintf ( 1, '  Estimate the range of velocity and pressure\n' );
  fprintf ( 1, '  at the initial time T = 0, in the unit square.\n' );
  fprintf ( 1, '  Kinematic viscosity NU = %g\n', nu );
  fprintf ( 1, '  Fluid density RHO = %g\n', rho );

  n = 1000;
  xy_lo = 0.0;
  xy_hi = 1.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  t = 0.0;

  [ u, v, p ] = uvp_spiral ( nu, rho, n, x, y, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  U:  %14.6g  %14.6g\n', min ( u ), max ( u ) );
  fprintf ( 1, '  V:  %14.6g  %14.6g\n', min ( v ), max ( v ) );
  fprintf ( 1, '  P:  %14.6g  %14.6g\n', min ( p ), max ( p ) );

  return
end

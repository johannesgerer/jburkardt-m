function resid_spiral_test ( )

%*****************************************************************************80
%
%% RESID_SPIRAL_TEST samples the residual at the initial time.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/resid_spiral_test.m
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
  fprintf ( 1, 'RESID_SPIRAL_TEST\n' );
  fprintf ( 1, '  Spiral Flow:\n' );
  fprintf ( 1, '  Sample the Navier-Stokes residuals\n' );
  fprintf ( 1, '  at the initial time T = 0, on the unit square.\n' );
  fprintf ( 1, '  Kinematic viscosity NU = %g\n', nu );
  fprintf ( 1, '  Fluid density RHO = %g\n', rho );

  n = 1000;
  xy_lo = 0.0;
  xy_hi = 1.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  t = 0.0;

  [ ur, vr, pr ] = resid_spiral ( nu, rho, n, x, y, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ur:  %14.6g  %14.6g\n', min ( abs ( ur ) ), max ( abs ( ur ) ) );
  fprintf ( 1, '  Vr:  %14.6g  %14.6g\n', min ( abs ( vr ) ), max ( abs ( vr ) ) );
  fprintf ( 1, '  Pr:  %14.6g  %14.6g\n', min ( abs ( pr ) ), max ( abs ( pr ) ) );

  return
end

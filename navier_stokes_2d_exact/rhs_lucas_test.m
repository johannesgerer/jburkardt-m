function rhs_lucas_test ( )

%*****************************************************************************80
%
%% RHS_LUCAS_TEST samples the right hand side at the initial time.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/rhs_lucas_test.m
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
  nu = 1.0;
  rho = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RHS_LUCAS_TEST\n' );
  fprintf ( 1, '  Lucas Bystricky Flow\n' );
  fprintf ( 1, '  Sample the Navier-Stokes right hand sides\n' );
  fprintf ( 1, '  at the initial time T = 0, using the unit square.\n' );
  fprintf ( 1, '  Kinematic viscosity NU = %g\n', nu );
  fprintf ( 1, '  Fluid density RHO = %g\n', rho );

  n = 1000;
  xy_lo = 0.0;
  xy_hi = 1.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  t = 0.0;

  [ f, g, h ] = rhs_lucas ( nu, rho, n, x, y, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F:  %14.6g  %14.6g\n', min ( f ), max ( f ) );
  fprintf ( 1, '  G:  %14.6g  %14.6g\n', min ( g ), max ( g ) );
  fprintf ( 1, '  H:  %14.6g  %14.6g\n', min ( h ), max ( h ) );

  return
end

function ns3de_test02 ( )

%*****************************************************************************80
%
%% NS3DE_TEST02 samples the residual at the initial time.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_3d_exact/ns3de_test02.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2015
%
%  Author:
%
%    John Burkardt
%
  a = pi / 4.0;
  d = pi / 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NS3DE_TEST02\n' );
  fprintf ( 1, '  Sample the Navier-Stokes residuals' );
  fprintf ( 1, '  at the initial time T = 0, using a region that is \n' );
  fprintf ( 1, '  the cube centered at (0,0,0) with "radius" 1.0,\n' );
  fprintf ( 1, '  Parameter A = %g\n', a );
  fprintf ( 1, '  Parameter D = %g\n', d );

  n = 1000;
  x = 2.0 * rand ( n, 1 ) - 1.0;
  y = 2.0 * rand ( n, 1 ) - 1.0;
  z = 2.0 * rand ( n, 1 ) - 1.0;
  t = 0.0;

  [ ur, vr, wr, pr ] = resid_ethier ( a, d, n, x, y, z, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ur:  %14.6g  %14.6g\n', min ( abs ( ur ) ), max ( abs ( ur ) ) );
  fprintf ( 1, '  Vr:  %14.6g  %14.6g\n', min ( abs ( vr ) ), max ( abs ( vr ) ) );
  fprintf ( 1, '  Wr:  %14.6g  %14.6g\n', min ( abs ( wr ) ), max ( abs ( wr ) ) );
  fprintf ( 1, '  Pr:  %14.6g  %14.6g\n', min ( abs ( pr ) ), max ( abs ( pr ) ) );

  return
end

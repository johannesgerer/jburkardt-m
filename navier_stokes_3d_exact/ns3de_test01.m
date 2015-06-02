function ns3de_test01 ( )

%*****************************************************************************80
%
%% NS3DE_TEST01 samples the solution at the initial time.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_3d_exact/ns3de_test01.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2015
%
%  Author:
%
%    John Burkardt
%
  a = pi / 4.0;
  d = pi / 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NS3DE_TEST01\n' );
  fprintf ( 1, '  Estimate the range of velocity and pressure\n' );
  fprintf ( 1, '  at the initial time T = 0, in a region that is the \n' );
  fprintf ( 1, '  cube centered at (0,0,0) with "radius" 1.0.\n' );
  fprintf ( 1, '  Parameter A = %g\n', a );
  fprintf ( 1, '  Parameter D = %g\n', d );

  n = 1000;
  x = 2.0 * rand ( n, 1 ) - 1.0;
  y = 2.0 * rand ( n, 1 ) - 1.0;
  z = 2.0 * rand ( n, 1 ) - 1.0;
  t = 0.0;

  [ u, v, w, p ] = uvwp_ethier ( a, d, n, x, y, z, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  U:  %14.6g  %14.6g\n', min ( u ), max ( u ) );
  fprintf ( 1, '  V:  %14.6g  %14.6g\n', min ( v ), max ( v ) );
  fprintf ( 1, '  W:  %14.6g  %14.6g\n', min ( w ), max ( w ) );
  fprintf ( 1, '  P:  %14.6g  %14.6g\n', min ( p ), max ( p ) );

  return
end

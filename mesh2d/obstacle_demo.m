function obstacle_demo ( )

%*****************************************************************************80
%
%% OBSTACLE_DEMO demonstrates MESH2D on the 8x2 channel with square obstacle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 November 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OBSTACLE_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D on the channel with a square obstacle.\n' );

  clf

  warning off
%
%  #1) Simple input, channel
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 1:\n' );
  fprintf ( 1, '  Channel, no obstacle.\n' );

  v = [ 0.0, -1.0; 8.0, -1.0; 8.0, +1.0; 0.0, +1.0 ];

  [ p, t ] = mesh2d ( v );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause
%
%  #2) Repeat, but request elements of size 1/4.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 2:\n' );
  fprintf ( 1, '  Channel, max element size is 0.25.\n' );

  v = [ 0.0, -1.0; 8.0, -1.0; 8.0, +1.0; 0.0, +1.0 ];

  hdata = [];
  hdata.hmax = 0.25;

  [ p, t ] = mesh2d ( v, [], hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause
%
%  #3) Repeat, but include hole.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 3:\n' );
  fprintf ( 1, '  Channel, max element size is 0.25, obstacle inserted.\n' );

  v = [ 0.0, -1.0; 8.0, -1.0; 8.0, +1.0; 0.0, +1.0;
        1.5, -0.5; 1.5, +0.5; 2.5, +0.5; 2.5, -0.5 ];
  e = [ 1, 2; 2, 3; 3, 4; 4, 1;
        5, 6; 6, 7; 7, 8; 8, 5 ];
  hdata = [];
  hdata.hmax = 0.25;

  [ p, t ] = mesh2d ( v, e, hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause

  return
end

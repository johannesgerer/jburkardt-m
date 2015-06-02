function ell_demo ( )

%*****************************************************************************80
%
%% ELL_DEMO demonstrates MESH2D on the L-shaped region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELL_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D on the L-shaped region.\n' );

  clf

  warning off
%
%  #1) Simple input, 6 vertices.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 1:\n' );
  fprintf ( 1, '  Minimal Input\n' );
  fprintf ( 1, '  Use 6 vertices on the boundary.\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  [ p, t ] = mesh2d ( v );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause
%
%  #2) = Example #1, with some small segments.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 2:\n' );
  fprintf ( 1, '  Set a few small boundary segments.\n' );
  fprintf ( 1, '  Use 8 vertices on the boundary.\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 0.25; 2.0, 0.5; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  [ p, t ] = mesh2d ( v );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, ...
    '  %d boundary vertices input, %d nodes and %d triangles created\n', ...
    nv, np, nt );
  pause
%
%  #3) = Example #1, but now I specify a maximum element size of 0.2.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 3:\n' );
  fprintf ( 1, '  Set maximum element size HDATA.HMAX = 0.1\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  hdata = [];
  hdata.hmax = 0.1;

  [ p, t ] = mesh2d ( v, [], hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause
%
%  #4) = Example #1, but now specify a density function.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 4:\n' );
  fprintf ( 1, '  Specify small elements near reentrant corner using a size function.\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  hdata = [];
  hdata.fun = @hfun1;

  [ p, t ] = mesh2d ( v, [], hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause
%
%  #5) Same as #1, but refine.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 5:\n' );
  fprintf ( 1, '  Repeat example #1, then call refine ( ).\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  [ p, t ] = mesh2d ( v );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause

  [ p, t ] = refine ( p, t );
%
%  Since REFINE doesn't redraw the mesh, I had to guess how to do it here.
%
   clf
   hold on
   plot ( v(:,1 ), v(:,2), 'r.', 'MarkerSize', 32 );
   axis equal
   pause
   plot(p(:,1),p(:,2),'b.', 'Markersize', 16 )
   plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 32 );
   pause ( )
   patch('faces',t(:,:),'vertices',p,'facecolor','w','edgecolor','b');
%  patch('faces',edge,'vertices',v,'facecolor','none','edgecolor','k')
   plot ( p(:,1), p(:,2), 'b.', 'Markersize', 16 )
   plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 32 );
   axis equal off;
   hold off

   print ( '-dpng', 'ell_mesh5.png' );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );

  pause
%
%  #6) Same as #2, but smooth.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 6:\n' );
  fprintf ( 1, '  Repeat example #2, then call smoothmesh ( ).\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 0.25; 2.0, 0.5; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  [ p, t ] = mesh2d ( v );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause

  [ p, t ] = smoothmesh ( p, t );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );

  redisplay ( v, p, t );

  pause
%
%  Close the figure.
%
  close ( gcf )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELL_DEMO:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function h = hfun1 ( x, y )

%*****************************************************************************80
%
%% HFUN1 is a size-function for the L-shaped region.
%
%  Discussion:
%
%    The smallest size is at (1.0,1.0), and sizes increase as their distance
%    from that point increases.
%
  h = 0.01 + 0.1 * sqrt ( ( x - 1.0 ).^2  + ( y - 1.0 ).^2 );

  return
end

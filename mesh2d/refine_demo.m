function refine_demo ( )

%*****************************************************************************80
%
%% REFINE_DEMO demonstrates the MESH2D refinement option on the L-shaped region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'REFINE_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D refinement option on the L-shaped region.\n' );

  fprintf ( 1, '  1) Create a default mesh.\n' );
  fprintf ( 1, '  2) Use the default refinement option.\n' );
  fprintf ( 1, '  3) Use the refinement option with a mask vector.\n' );

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


 figure ( 1 )
  [ p, t ] = mesh2d ( v );
  title ( 'Initial mesh', 'Fontsize', 24 )
  print ( '-dpng', 'refine_demo1.png' );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, ...

    '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
%
%  #2) Same as #1, but the refine (only those triangles with centroid above y=1/2).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 2:\n' );
  fprintf ( 1, '  Refine all triangles with centroid above y=1/2.\n' )

 c = centroid_mesh ( p, t );
  ti = zeros ( nt, 1 );

 ti = logical ( ti );
  ti(1:nt,1) = ( 0.5 <= c(1:nt,2) );

  [ p2, t2 ] = refine ( p, t, ti );


 figure ( 2 )
  clf
  hold on
  axis equal
  patch ( 'faces', t2(:,:), 'vertices', p2, 'facecolor', 'w', 'edgecolor', 'b' );
  plot ( c(:,1), c(:,2), 'k.', 'markersize', 8 );
  plot ( p2(:,1), p2(:,2), 'b.', 'markersize', 8 );
  plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 8 );
  axis equal off;
  hold off
  title ( 'Refine triangles with Y centroid above 1/2', 'Fontsize', 24 )

 print ( '-dpng', 'refine_demo2.png' );

  [ nv, ~ ] = size ( v );
  [ np2, ~ ] = size ( p2 );
  [ nt2, ~ ] = size ( t2 );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np2, nt2 );
%
%  #3) Now refine those triangles with centroid x < 1/2.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXAMPLE 3:\n' );
  fprintf ( 1, '  Refine all triangles with centroid x < 1.\n' )

 c = centroid_mesh ( p2, t2 );

 ti = zeros ( nt2, 1 );
  ti = logical ( ti );
  ti(1:nt2,1) = ( c(1:nt2,1) < 0.5 );

  [ p3, t3 ] = refine ( p2, t2, ti );


 figure ( 3 )
  clf
  hold on
  axis equal
  patch ( 'faces', t3(:,:), 'vertices', p3, 'facecolor', 'w', 'edgecolor', 'b' );
  plot ( c(:,1), c(:,2), 'k.', 'markersize', 8 );
  plot ( p3(:,1), p3(:,2), 'b.', 'markersize', 8 );
  plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 8 );
  axis equal off;
  hold off
  title ( 'Refine triangles with X centroid less than 0.5.', 'Fontsize', 24 )

 print ( '-dpng', 'refine_demo3.png' );

  [ nv, ~ ] = size ( v );
  [ np3, ~ ] = size ( p3 );
  [ nt3, ~ ] = size ( t3 );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np3, nt3 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'REFINE_DEMO:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end


function mesh2d_write ( )

%*****************************************************************************80
%
%% MESH2D_WRITE demonstrates how to write MESH2D node and element files.
%
%  Discussion:
%
%    Let us create a triangulation using MESH2D, and then write the
%    node and element data to files, with the properties:
%
%    * the node file has 2 columns of reals;
%    * the element file has 3 columns of integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use MESH2D to create a mesh for the L-shaped region.\n' );
  fprintf ( 1, '  Then write the information to node and element files.\n' );
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

  node_filename = 'mesh1_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh1_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
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
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );

  node_filename = 'mesh2_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh2_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
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

  node_filename = 'mesh3_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh3_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
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

  node_filename = 'mesh4_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh4_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
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
   plot ( v(:,1 ), v(:,2), 'r.', 'MarkerSize', 8 );
   axis equal
   pause
   plot(p(:,1),p(:,2),'b.','markersize',8)
   plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 8 );
   pause ( )
   patch('faces',t(:,:),'vertices',p,'facecolor','w','edgecolor','b');
%  patch('faces',edge,'vertices',v,'facecolor','none','edgecolor','k')
   plot(p(:,1),p(:,2),'b.','markersize',8)
   plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 8 );
   axis equal off;
   hold off

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );

  node_filename = 'mesh5_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh5_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
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
%
%  Since SMOOTHMESH doesn't redraw the mesh, I had to guess how to do it here.
%
   clf
   hold on
   plot ( v(:,1 ), v(:,2), 'r.', 'MarkerSize', 8 );
   axis equal
   pause
   plot(p(:,1),p(:,2),'b.','markersize',8)
   plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 8 );
   pause ( )
   patch('faces',t(:,:),'vertices',p,'facecolor','w','edgecolor','b');
%  patch('faces',edge,'vertices',v,'facecolor','none','edgecolor','k')
   plot(p(:,1),p(:,2),'b.','markersize',8)
   plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 8 );
   axis equal off;
   hold off

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );

  node_filename = 'mesh6_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh6_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
  pause
%
%  Close the figure.
%
  close ( gcf )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %12d', round ( table(i,j) ) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

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


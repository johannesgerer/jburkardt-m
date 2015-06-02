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
%    23 August 2014
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../mesh2d' );

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
  mesh2d_write_test01 ( );
%
%  #2) = Example #1, with some small segments.
%
  mesh2d_write_test02 ( );
%
%  #3) = Example #1, but now I specify a maximum element size of 0.2.
%
  mesh2d_write_test03 ( );
%
%  #4) = Example #1, but now specify a density function.
%
  mesh2d_write_test04 ( );
%
%  #5) Same as #1, but refine.
%
  mesh2d_write_test05 ( );
%
%  #6) Same as #2, but smooth.
%
  mesh2d_write_test06 ( );
%
%  #7) A channel with baffles.
%
  mesh2d_write_test07 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../mesh2d' );

  return
end
function mesh2d_write_test01 ( )

%*****************************************************************************80
%
%% MESH2D_WRITE_TEST01 defines a simple region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE_TEST01:\n' );
  fprintf ( 1, '  Minimal Input\n' );
  fprintf ( 1, '  Use 6 vertices on the boundary.\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  [ p, t ] = mesh2d ( v );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, ...
    '  %d boundary vertices input, %d nodes and %d triangles created\n', ...
    nv, np, nt );

  node_filename = 'mesh1_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh1_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
  pause

  return
end
function mesh2d_write_test02 ( )

%*****************************************************************************80
%
%% MESH2D_WRITE_TEST02 repeats example 1, but sets a few small elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE_TEST02\n' );
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

 return
end
function mesh2d_write_test03 ( )

%*****************************************************************************80
%
%% MESH2D_WRITE_TEST03 repeats example 1, but sets the maximum element size.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE_TEST03\n' );
  fprintf ( 1, '  Repeat example 1, but set maximum element size HDATA.HMAX = 0.1\n' );

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

  return
end
function mesh2d_write_test04 ( )

%*****************************************************************************80
%
%% MESH2D_WRITE_TEST04 repeats example 1, with a density function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE_TEST04\n' );
  fprintf ( 1, '  Repeat example #1, but now specify small elements \n' );
  fprintf ( 1, '  near reentrant corner using a size function.\n' );

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

  return
end
function mesh2d_write_test05 ( )

%*****************************************************************************80
%
%% MESH2D_WRITE_TEST05 repeats example 1, adding refinement.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE_TEST05\n' );
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

  return
end
function mesh2d_write_test06 ( )

%*****************************************************************************80
%
%% MESH2D_WRITE_TEST06 repeats example 2, adding smoothing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE_TEST06\n' );
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

  return
end
function mesh2d_write_test07 ( )

%*****************************************************************************80
%
%% MESH2D_WRITE_TEST07 sets up the baffle mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_WRITE_TEST07\n' );
  fprintf ( 1, '  Channel with baffles, max element size is 0.50.\n' );

  v = [ 0.0,  1.0; 12.0, 1.0; 12.0, 7.0; 0.0, 7.0; ...
        1.8, 1.68;  1.6, 2.0;  1.8, 2.32;  2.2, 2.32;  2.4, 2.0;  2.2, 1.68; ...
        5.8, 1.68;  5.6, 2.0;  5.8, 2.32;  6.2, 2.32;  6.4, 2.0;  6.2, 1.68; ...
        9.8, 1.68;  9.6, 2.0;  9.8, 2.32; 10.2, 2.32; 10.4, 2.0; 10.2, 1.68; ...
        1.8, 3.68;  1.6, 4.0;  1.8, 4.32;  2.2, 4.32;  2.4, 4.0;  2.2, 3.68; ...
        5.8, 3.68;  5.6, 4.0;  5.8, 4.32;  6.2, 4.32;  6.4, 4.0;  6.2, 3.68; ...
        9.8, 3.68;  9.6, 4.0;  9.8, 4.32; 10.2, 4.32; 10.4, 4.0; 10.2, 3.68; ...
        1.8, 5.68;  1.6, 6.0;  1.8, 6.32;  2.2, 6.32;  2.4, 6.0;  2.2, 5.68; ...
        5.8, 5.68;  5.6, 6.0;  5.8, 6.32;  6.2, 6.32;  6.4, 6.0;  6.2, 5.68; ...
        9.8, 5.68;  9.6, 6.0;  9.8, 6.32; 10.2, 6.32; 10.4, 6.0; 10.2, 5.68; ...
        3.8, 2.68;  3.6, 3.0;  3.8, 3.32;  4.2, 3.32;  4.4, 3.0;  4.2, 2.68; ...
        7.8, 2.68;  7.6, 3.0;  7.8, 3.32;  8.2, 3.32;  8.4, 3.0;  8.2, 2.68; ...
        3.8, 4.68;  3.6, 5.0;  3.8, 5.32;  4.2, 5.32;  4.4, 5.0;  4.2, 4.68; ...
        7.8, 4.68;  7.6, 5.0;  7.8, 5.32;  8.2, 5.32;  8.4, 5.0;  8.2, 4.68  ...
      ];

  e = [ 1,  2;  2,  3;  3,  4;  4,  1; ...
       5,  6;  6,  7;  7,  8;  8,  9;  9, 10; 10,  5; ...
      11, 12; 12, 13; 13, 14; 14, 15; 15, 16; 16, 11; ...
      17, 18; 18, 19; 19, 20; 20, 21; 21, 22; 22, 17; ...
      23, 24; 24, 25; 25, 26; 26, 27; 27, 28; 28, 23; ...
      29, 30; 30, 31; 31, 32; 32, 33; 33, 34; 34, 29; ...
      35, 36; 36, 37; 37, 38; 38, 39; 39, 40; 40, 35; ...
      41, 42; 42, 43; 43, 44; 44, 45; 45, 46; 46, 41; ...
      47, 48; 48, 49; 49, 50; 50, 51; 51, 52; 52, 47; ...
      53, 54; 54, 55; 55, 56; 56, 57; 57, 58; 58, 53; ...
      59, 60; 60, 61; 61, 62; 62, 63; 63, 64; 64, 59; ...
      65, 66; 66, 67; 67, 68; 68, 69; 69, 70; 70, 65; ...
      71, 72; 72, 73; 73, 74; 74, 75; 75, 76; 76, 71; ...
      77, 78; 78, 79; 79, 80; 80, 81; 81, 82; 82, 77  ...
     ];

  hdata = [];
  hdata.hmax = 0.50;

  [ p, t ] = mesh2d ( v, e, hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );

  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );

  node_filename = 'mesh7_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'mesh7_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
  pause

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

%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2012
%
%  Author:
%
%    John Burkardt
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

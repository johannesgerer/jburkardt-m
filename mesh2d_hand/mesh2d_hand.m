function mesh2d_hand ( )

%*****************************************************************************80
%
%% MESH2D_HAND demonstrates MESH2D on data that outlines a human hand.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 August 2013
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../mesh2d' )
%
%  Suppress the warnings about the soon-to-be-obsolete function "tsearch".
%
  warning off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_HAND:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D on the outline of a hand.\n' );
%
%  Load the vertex data.
%
  v = load ( 'hand_vertices.txt' );
%
%  Display the nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vertices for the hand.\n' );

  v_num = length ( v );
%
%  Set up the edge array.
%
  e = zeros ( v_num, 2 );
  e(1:v_num,1) = ( 1 : v_num )';
  e(1:v_num-1,2) = ( 2 : v_num )';
  e(v_num,2) = 1;
%
%  Create the HDATA structure.
%  Set the HMAX field to specify the maximum element size.
%
  hdata = [];
  hdata.hmax = 0.01;
%
%  Clear the graphics frame.
%
  clf
%
%  Call MESH2D to determine the triangulation.
%  As part of the computation, it will display the vertices, nodes and elements.
%
  [ p, t ] = mesh2d ( v, e, hdata );
%
%  Count and report the vertices, nodes and elements.
%
  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, ...
    '  %d boundary vertices input, %d nodes and %d triangles created\n', ...
    nv, np, nt );
%
%  Write the node and element data to files.
%
  node_filename = 'hand_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'hand_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes stored as "%s"\n', node_filename );
  fprintf ( 1, '  Elements stored as "%s"\n', element_filename );
%
%  Clear the MATLAB path.
%
  rmpath ( '../mesh2d' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESH2D_HAND:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end


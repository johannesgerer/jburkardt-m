function meshfaces_test05 ( )

%*****************************************************************************80
%
%% MESHFACES_TEST05 tests MESHFACES on a square in a square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHFACES_TEST05:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESHFACES on an square in a square.\n' );
  fprintf ( 1, '  We want to mesh two adjacent regions in such a way\n' );
  fprintf ( 1, '  that the meshes use common nodes on their interface.\n' );
%
%  Here are all the nodes to be used.
%
  node = [ 
    0.0, 0.0; 
    6.0, 0.0; 
    6.0, 5.0; 
    0.0, 5.0; 
    1.0, 1.0;
    4.0, 1.0;
    4.0, 4.0;
    1.0, 4.0 ];
%
%  Here are all the edges.
%
  edge = [
    1,2;
    2,3;
    3,4;
    4,1;
    5,6;
    6,7;
    7,8;
    8,5 ];
%
%  Face 1 is the outer strip.
%  Face 2 is the inner square.
%
  face{1} = [1,2,3,4,5,6,7,8];
  face{2} = [5,6,7,8];
%
%  HDATA allows us to set options.
%    HDATA.HMAX is the maximum triangle side length.
%
  hdata = [];
  hdata.hmax = 0.5;
%
%  MESHFACES output is:
%
%    P     = Nx2 array of nodal XY co-ordinates.
%    T     = Mx3 array of triangles as indicies into P, defined with a
%            counter-clockwise node ordering.
%    FNUM  = Mx1 array of face numbers for each triangle in T.
%
  [ p, t, fnum, stats ] = meshfaces ( node, edge, face, hdata );

  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %d nodes\n', np );
  fprintf ( 1, '  %d triangles\n', nt );
%
%  Save the plot in a file.
%
  plot_filename = 'test05.png';
  print ( '-dpng', plot_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A copy of the mesh saved as "%s"\n', plot_filename );
%
%  Write nodes to a file.
%
  node_filename = 'test05_nodes.txt';
  node_unit = fopen ( node_filename, 'wt' );
  for i = 1 : np
    fprintf ( node_unit, '%g  %g\n', p(i,1), p(i,2) );
  end
  fclose ( node_unit );

  fprintf ( 1, '  Node coordinates written to "%s"\n', node_filename );
%
%  Write elements to a file.
%
  element_filename = 'test05_elements.txt';
  element_unit = fopen ( element_filename, 'wt' );
  for i = 1 : nt
    fprintf ( element_unit, '%d  %d  %d\n', t(i,1), t(i,2), t(i,3) );
  end
  fclose ( element_unit );

  fprintf ( 1, '  Element definitions written to "%s"\n', element_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHFACES_TEST05:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end


function airfoil_exterior_demo ( )

%*****************************************************************************80
%
%% AIRFOIL_EXTERIOR_DEMO demonstrates MESH2D on an airfoil.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'AIRFOIL_EXTERIOR_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D on an airfoil\n' );

  warning off
%
%  S
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Airfoil, max element size is 0.50.\n' );
%
%  Load (clockwise) list of vertices defining airfoil.
%
  v = load ( 'airfoil.txt' );
%
%  Count the airfoil vertices.
%
  [ airfoil_vertex_num, ~ ] = size ( v );
%
%  Add 4 (counterclockwise) vertices defining the enclosing box.
%
  v = [ ...
    v; ...
   -2.0, -2.0; ...
   12.0, -2.0; ...
   12.0,  3.0; ...
   -2.0,  3.0 ];
%
%  Display the vertices..
%
  plot ( v(:,1), v(:,2), 'b.', 'MarkerSize', 15 );

  axis equal
  grid on
  xlabel ( '<--- X --->', 'FontSize', 16 )
  ylabel ( '<--- Y --->', 'FontSize', 16 )
  title ( 'Airfoil vertices', 'FontSize', 24 )
  filename = 'airfoil_exterior_vertices.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Boundary node plot saved as "%s"\n', filename );
%
%  List the pairs of vertices that form line segments around the wing.

  i1 = 1 : airfoil_vertex_num;
  j1 = 2 : airfoil_vertex_num + 1;
  j1(airfoil_vertex_num) = 1;
%
%  Append pairs of vertices that form lines of the enclosing box.
%
  i2 = airfoil_vertex_num + [ 1, 2, 3, 4 ];
  j2 = airfoil_vertex_num + [ 2, 3, 4, 1 ];
%
%  This is your list of boundary elements.
%
  e = [ [ i1, i2 ]', [ j1, j2 ]' ];
%
%  Define HDATA, a way to pass extra parameters to MESH2D.
%  Sete HDATA.HMAX to specify the maximum desired element size.
%
  hdata = [];
  hdata.hmax = 0.0125;

  clf
%
%  Get the nodes and elements of a triangulation of the region.
%
  [ p, t ] = mesh2d ( v, e );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );

  fprintf ( 1, ...
    '  %d boundary vertices input, %d nodes and %d triangles created\n', ...
    nv, np, nt );

  pause
%
%  Close the figure.
%
  close ( gcf )
%
%  Write the nodes and elements to files.
%
  node_filename = 'airfoil_exterior_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'airfoil_exterior_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote nodes to file "%s"\n', node_filename );
  fprintf ( 1, '  Wrote elements to file "%s"\n', element_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'AIRFOIL_EXTERIOR_DEMO:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

function rectangle_minus_circle_demo ( )

%*****************************************************************************80
%
%% RECTANGLE_MINUS_CIRCLE_DEMO demonstrates MESH2D on a rectangle minus a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RECTANGLE_MINUS_CIRCLE_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D on a rectangle minus a circle.\n' );

  clf

  warning off
%
%  Display the nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rectangle (4 nodes) minus circle (12 nodes).\n' );

  n = 16;

  v = zeros ( n, 2 );
  e = zeros ( n, 2 );
%
%  We trace the boundary in anti-clockwise order.
%
  v(1:4,1:2) = [ ...
    -1.0, -1.0; ...
    +1.0, -1.0; ...
    +1.0, +1.0; ...
    -1.0, +1.0 ];

  e(1:4,1:2) = [ ...
    1, 2; ...
    2, 3; ...
    3, 4; ...
    4, 1 ];

  n_rectangle = 4;
  
  r = 0.25;
  cx = 0.5;
  cy = 0.5;
  i = 4;
  n_circle = 12
  for j = 1 : n_circle
    theta = ( j - 1 ) * 2.0 * pi / n_circle;
    x = r * cos ( theta );
    y = r * sin ( theta );
    i = i + 1;
    v(i,1) = x + cx;
    v(i,2) = y + cy;
    e(i,1) = j + n_rectangle;
    e(i,2) = mod ( j, n_circle ) + n_rectangle + 1;
  end

  v
  e
%
%  Set up the auxilliary data structure.
%
  hdata = [];
%
%  Set the maximum element size.
%
  hdata.hmax = 0.125;

  [ p, t ] = mesh2d ( v, e, hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', ...
    nv, np, nt );
%
%  Write nodes and elements to FEM files.
%
  node_filename = 'rectangle_minus_circle_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'rectangle_minus_circle_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote FEM node file "%s"\n', node_filename );
  fprintf ( 1, '  Wrote FEM element file "%s"\n', element_filename );
%
%  Write mesh to XML file.
%
  xml_filename = 'rectangle_minus_circle.xml';
  mesh2d_to_xml ( xml_filename, p, t );
  fprintf ( 1, '  Wrote XML file "%s"\n', xml_filename );

  return
end

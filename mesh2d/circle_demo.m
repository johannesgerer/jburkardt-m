function circle_demo ( )

%*****************************************************************************80
%
%% CIRCLE_DEMO demonstrates MESH2D on a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D on a circle.\n' );

  clf

  warning off
%
%  Display the nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Circle.\n' );

  n = 16;

  v = zeros ( n, 2 );
  e = zeros ( n, 2 );
%
%  We trace the boundary in anti-clockwise order.
%
  r = 3.0;
  i = 0;
  for j = 0 : n - 1
    theta = j * 2.0 * pi / n;
    x = r * cos ( theta );
    y = r * sin ( theta );
    i = i + 1;
    v(i,1) = x;
    v(i,2) = y;
    e(i,1) = i;
    e(i,2) = mod ( i, n ) + 1;
  end
%
%  Set up the auxilliary data structure.
%
  hdata = [];
%
%  Set the maximum element size.
%
  hdata.hmax = 0.25;

  [ p, t ] = mesh2d ( v, e, hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', ...
    nv, np, nt );
%
%  Write nodes and elements to FEM files.
%
  node_filename = 'circle_nodes.txt';
  r8mat_write ( node_filename, 2, np, p' );
  element_filename = 'circle_elements.txt';
  i4mat_write ( element_filename, 3, nt, t' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote FEM node file "%s"\n', node_filename );
  fprintf ( 1, '  Wrote FEM element file "%s"\n', element_filename );
%
%  Write mesh to XML file.
%
  xml_filename = 'circle.xml';
  mesh2d_to_xml ( xml_filename, p, t );
  fprintf ( 1, '  Wrote XML file "%s"\n', xml_filename );

  return
end

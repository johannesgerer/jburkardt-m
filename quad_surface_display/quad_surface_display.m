function quad_surface_display ( node_num, node_xy, quad_num, quad_node, value )

%*****************************************************************************80
%
%% QUAD_SURFACE_DISPLAY plots a surface defined by a quadrilateral mesh.
%
%  Discussion:
%
%    On an quadrilateral mesh, values are assigned to nodes.
%    For points inside a quadrilateral, Z(X,Y) is determined by the
%    bilinear interpolant.
%
%    This version of the code does not try to deal with the fact
%    that the surface Z(X,Y) corresponding to a quadrilateral is
%    not, in general flat.
%
%  Usage:
%
%    quad_surface_display ( node_num, node_xy, quad_num, quad_node, value )
%
%    where
%
%    * node_num, the number of nodes.
%    * node_xy, the coordinates of the nodes.
%    * quad_num, the number of quadrilaterals.
%    * quad_node, the nodes of each quadrilateral.
%    * value, the value assigned to each node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer QUAD_NUM, the number of quadrilaterals.
%
%    Input, integer QUAD_NODE(4,QUAD_NUM), the nodes of each quadrilateral.
%
%    Input, real VALUE(NODE_NUM), the value assigned to each node.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_SURFACE_DISPLAY:\n' );
  fprintf ( 1, '  Display a surface defined by a quadrliateral mesh.\n' );

  zmax = max ( value(1:node_num) );
  zmin = min ( value(1:node_num) );
%
%  Pick the colors that will correspond to the minimum and maximum
%  values of Z.
%
  rmax = 0.8;
  gmax = 0.2;
  bmax = 0.1;

  rmin = 0.1;
  gmin = 0.3;
  bmin = 0.7;

  hold on

  for quad = 1 : quad_num
%
%  Pick out the nodes of the quadrilateral.
%
    x1 = node_xy(1,quad_node(1,quad));
    y1 = node_xy(2,quad_node(1,quad));
    z1 = value(quad_node(1,quad));

    x2 = node_xy(1,quad_node(2,quad));
    y2 = node_xy(2,quad_node(2,quad));
    z2 = value(quad_node(2,quad));

    x3 = node_xy(1,quad_node(3,quad));
    y3 = node_xy(2,quad_node(3,quad));
    z3 = value(quad_node(3,quad));

    x4 = node_xy(1,quad_node(4,quad));
    y4 = node_xy(2,quad_node(4,quad));
    z4 = value(quad_node(4,quad));
%
%  Draw the top of the prism, using a color corresponding to the average height.
%
    z = ( z1 + z2 + z3 + z4 ) / 4.0;

    r = ( ( zmax - z ) * rmin + ( z - zmin ) * rmax ) / ( zmax - zmin );
    g = ( ( zmax - z ) * gmin + ( z - zmin ) * gmax ) / ( zmax - zmin );
    b = ( ( zmax - z ) * bmin + ( z - zmin ) * bmax ) / ( zmax - zmin );

    fill3 ( [ x1, x2, x3, x4 ], ...
            [ y1, y2, y3, y4 ], ...
            [ z1, z2, z3, z4 ], [ r, g, b ] )
%
%  Draw the bottom of the prism, using black.
%
    fill3 ( [ x1,  x2,  x3,  x4 ], ...
            [ y1,  y2,  y3,  y4 ], ...
            [ 0.0, 0.0, 0.0, 0.0 ], [ rmin, gmin, bmin ] )
%
%  Draw the sides of the prism, using a lighter shade of the top color.
%
    r = sqrt ( r );
    g = sqrt ( g );
    b = sqrt ( b );

    fill3 ( [ x1,  x2,  x2,  x1 ], ...
            [ y1,  y2,  y2,  y1 ], ...
            [ 0.0, 0.0, z2,  z1 ], [ r, g, b ] )

    fill3 ( [ x2,  x3,  x3,  x2 ], ...
            [ y2,  y3,  y3,  y2 ], ...
            [ 0.0, 0.0, z3,  z2 ], [ r, g, b ] )

    fill3 ( [ x3,  x4,  x4,  x3 ], ...
            [ y3,  y4,  y4,  y3 ], ...
            [ 0.0, 0.0, z4,  z3 ], [ r, g, b ] )

    fill3 ( [ x4,  x1,  x1,  x4 ], ...
            [ y4,  y1,  y1,  y4 ], ...
            [ 0.0, 0.0, z1,  z4 ], [ r, g, b ] )

  end
%
%  The plot is done.  Label it.
%
  xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16 );

  ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16, 'Rotation', 0 );

  title ( 'Z(X,Y)', 'FontName', 'Helvetica', 'FontWeight', ...
    'bold', 'FontSize', 16 );

  view ( 3 )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_SURFACE_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

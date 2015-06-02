function display_element ( prefix, element )

%*****************************************************************************80
%
%% DISPLAY_ELEMENT lists the coordinates of nodes making up an element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the common filename prefix for the node and
%    element files.
%
%    Input, integer ELEMENT, the index of the element.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISPLAY_ELEMENT\n' );
  fprintf ( 1, '  List coordinates of the nodes making up an element.\n' );
  fprintf ( 1, '  Element and node file prefix is "%s".\n', prefix );

  element_filename = sprintf ( '%s_elements.txt', prefix );
  node_filename = sprintf ( '%s_nodes.txt', prefix );

  element_node = load ( element_filename );
  node_xyz = load ( node_filename );

  [ element_num, element_order ] = size ( element_node );
  [ node_num, dim_num ] = size ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEO ordering:\n' );
  fprintf ( 1, '  Node coordinates for element %d\n', element );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I     N          X                 Y               Z\n' );
  fprintf ( 1, '\n' );
  for j = 1 : element_order
    n = element_node(element,j);
    fprintf ( 1, '  %2d  %4d  %14.6g  %14.6g  %14.6g\n', j, n, node_xyz(n,1:3) );
  end

  leo_to_gmsh = [...
     1,  2,  3,  4,  5, ...
     7, 10, 11,  8,  6, ...
    12, 18, 19, 13, 20, ...
    14,  9, 15, 16, 17 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Gmsh ordering:\n' );
  fprintf ( 1, '  Node coordinates for element %d\n', element );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I     N          X                 Y               Z\n' );
  fprintf ( 1, '\n' );
  for j = 1 : element_order
    k = leo_to_gmsh(j);
    n = element_node(element,k);
    fprintf ( 1, '  %2d  %4d  %14.6g  %14.6g  %14.6g\n', j, n, node_xyz(n,1:3) );
  end
  return
end


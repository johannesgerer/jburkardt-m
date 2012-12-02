function stla_node_xyz_print ( node_num, node_xyz )

%*****************************************************************************80
%
%% STLA_NODE_XYZ_PRINT prints the node coordinates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of the nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Node         Coordinates\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num

    fprintf ( 1, '  %6d  %14f  %14f  %14f\n', node, node_xyz(1:3,node) );

  end

  return
end

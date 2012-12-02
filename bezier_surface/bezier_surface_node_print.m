function bezier_surface_node_print ( node_num, node_xyz )

%*****************************************************************************80
%
%% BEZIER_SURFACE_NODE_PRINT prints nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of the
%    nodes.
%
  dim_num = 3;

  r8mat_transpose_print ( dim_num, node_num, node_xyz, ...
    '  Bezier Surface Nodes:' );

  return
end

function [ value_min, value_mean, value_max, value_var ] = ...
  tet_mesh_quality2 ( node_num, node_xyz, tetra_order, tetra_num, ...
  tetra_node )

%*****************************************************************************80
%
%% TET_MESH_QUALITY2 returns a tet mesh quality factor.
%
%  Discussion:
%
%    The tet mesh quality measure is the minimum of the
%    corresponding tetrahedron quality measure, over all tetrahedrons in the
%    tet mesh.
%
%    This routine is designed for an order-4 tet mesh.  Order 10 tet meshes
%    may be input, but the extra nodes are ignored.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the nodes.
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the indices of the nodes
%    that make up the tetrahedrons.
%
%    Output, real VALUE_MIN, VALUE_MEAN, VALUE_MAX, VALUE_VAR,
%    the minimum, mean, maximum and variance of the quality measure.
%
  dim_num = 3;

  for tetra = 1 : tetra_num

    tetrahedron(1:dim_num,1:4) = node_xyz(1:dim_num,tetra_node(1:4,tetra));

    tetrahedron_quality(tetra) = tetrahedron_quality2_3d ( tetrahedron );

  end

  value_max  = max  ( tetrahedron_quality(1:tetra_num) );
  value_min  = min  ( tetrahedron_quality(1:tetra_num) );
  value_mean = mean ( tetrahedron_quality(1:tetra_num) );
  value_var  = var  ( tetrahedron_quality(1:tetra_num) );

  return
end

function [ node_num, tet_num ] = tet_mesh_order4_example_size ( )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_EXAMPLE_SIZE sizes an example linear tet mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer TET_NUM, the number of tetrahedrons.
%
  node_num = 63;
  tet_num = 144;

  return
end

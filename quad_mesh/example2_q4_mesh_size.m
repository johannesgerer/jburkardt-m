function [ node_num, element_num, hole_num ] = example2_q4_mesh_size ( )

%*****************************************************************************80
%
%% EXAMPLE2_Q4_MESH_SIZE sets sizes for example #2 Q4 mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, integer HOLE_NUM, the number of holes.
%
  element_num = 32;
  hole_num = 0;
  node_num = 37;

  return
end

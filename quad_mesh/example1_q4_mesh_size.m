function [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( )

%*****************************************************************************80
%
%% EXAMPLE1_Q4_MESH_SIZE sets sizes for example #1 Q4 mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2009
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
  element_num = 17;
  hole_num = 1;
  node_num = 28;

  return
end

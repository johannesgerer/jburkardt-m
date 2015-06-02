function [ node_num, node_dim, node_att_num, node_marker_num ] = ...
  triangle_node_size_example ( )

%*****************************************************************************80
%
%% TRIANGLE_NODE_SIZE_EXAMPLE returns the sizes of node information for the example.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_DIM, the spatial dimension.
%
%    Output, integer NODE_ATT_NUM, number of node attributes 
%    listed on each node record.
%
%    Output, integer NODE_MARKER_NUM, 1 if every node record 
%    includes a final boundary marker value.
%
  node_num = 21;
  node_dim = 2;
  node_att_num = 0;
  node_marker_num = 1;

  return
end

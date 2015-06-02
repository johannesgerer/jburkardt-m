function [ node_num, triangle_num, hole_num ] = ...
  triangulation_order3_example1_size ( )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_EXAMPLE1_SIZE sets sizes for a sample triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer NODE_NUM, the number of nodes.  
%
%    Output, integer TRIANGLE_NUM, the number of triangles. 
%
%    Output, integer HOLE_NUM, the number of holes.
%
  node_num = 13;
  triangle_num = 16;
  hole_num = 0;

  return
end

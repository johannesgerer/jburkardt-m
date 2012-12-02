function [ node_num, triangle_num, hole_num ] = ...
  triangulation_order3_example2_size ( )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_EXAMPLE2_SIZE sets sizes for a sample triangulation.
%
%  Diagram:
%
%   21-22-23-24-25
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%   16-17-18-19-20
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%   11-12-13-14-15
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%    6--7--8--9-10
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%    1--2--3--4--5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2007
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
  node_num = 25;
  triangle_num = 32;
  hole_num = 0;

  return
end

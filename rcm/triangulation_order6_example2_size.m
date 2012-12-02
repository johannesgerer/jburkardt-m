function [ node_num, triangle_num, hole_num ] = ...
  triangulation_order6_example2_size ( )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_EXAMPLE2_SIZE sets sizes for a sample triangulation.
%
%  Diagram:
%
%   21-22-23-24-25
%    |\  6 |\  8 |
%    | \   | \   |
%   16 17 18 19 20
%    |   \ |   \ |
%    | 5  \| 7  \|
%   11-12-13-14-15
%    |\  2 |\  4 |
%    | \   | \   |
%    6  7  8  9 10
%    | 1 \ | 3 \ |
%    |    \|    \|
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
%    Output, integer NODE_NUM, the number of points.
%
%    Output, integer TRIANGLE_NUM, the number of triangles.
%
%    Output, integer HOLE_NUM, the number of holes.
%
  node_num = 25;
  triangle_num = 8;
  hole_num = 0;

  return
end

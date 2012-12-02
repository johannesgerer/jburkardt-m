function [ xy, line_pointer, line_data ] = xyl_example ( point_num, ...
  line_num, line_data_num )

%*****************************************************************************80
%
%% XYL_EXAMPLE sets data suitable for a pair of XY and XYL files.
%
%  Discussion:
%
%    There are 13 points.
%    There are 3 lines.
%    There are 15 line data items.
%
%         4 12-11
%         /\ | |
%        /  \| |
%       /   13 |
%      /      \10
%     /        \
%    5          3
%    |          |
%    |     9--8 |
%    |     |  | |
%    |     |  | |
%    |     6--7 |
%    |          |
%    1----------2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer LINE_NUM, the number of lines.
%
%    Input, integer LINE_DATA_NUM, the number of line items.
%
%    Output, real XY(2,POINT_NUM), the point coordinates.
%
%    Output, integer LINE_POINTER(LINE_NUM+1), pointers to the
%    first line item for each line.
%
%    Output, integer LINE_DATA(LINE_DATA_NUM), indices
%    of points that form lines.
%
  xy(1:2,1:point_num) = [ ...
     0.0,   0.0; ...
     6.0,   0.0; ...
     6.0,   7.0; ...
     3.0,  10.0; ...
     0.0,   7.0; ...
     4.0,   1.0; ...
     5.0,   1.0; ...
     5.0,   4.0; ...
     4.0,   4.0; ...
     5.0,   8.0; ...
     5.0,  11.0; ...
     4.0,  11.0; ...
     4.0,   9.0 ]';

  line_pointer(1:line_num+1) = [ 1, 7, 12, 16 ];

  line_data(1:line_data_num) = [ ...
     1,  2,  3,  4,  5,  1, ...
     6,  7,  8,  9,  6, ...
    10, 11, 12, 13 ];

  return
end

function [ xyz, line_pointer, line_data ] = xyzl_example ( point_num, ...
  line_num, line_data_num )

%*****************************************************************************80
%
%% XYZL_EXAMPLE sets data suitable for a pair of XYZ and XYZL files.
%
%  Discussion:
%
%    There are 8 points.
%    There are 6 lines.
%    There are 18 line items.
%
%       8------7
%      /|     /|
%     / |    / |
%    5------6  |
%    |  4---|--3
%    | /    | /
%    |/     |/
%    1------2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2009
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
%    Input, integer  LINE_DATA_NUM, the number of line items.
%
%    Output, real XY(2,POINT_NUM), the point coordinates.
%
%    Output, integer LINE_POINTER(LINE_NUM+1), pointers to the
%    first line item for each line.
%
%    Output, integer LINE_DATA(LINE_DATA_NUM), indices
%    of points that form lines.
%
  xyz(1:3,1:point_num) = [ ...
     0.0,  0.0,  0.0; ...
     1.0,  0.0,  0.0; ...
     1.0,  1.0,  0.0; ...
     0.0,  1.0,  0.0; ...
     0.0,  0.0,  1.0; ...
     1.0,  0.0,  1.0; ...
     1.0,  1.0,  1.0; ...
     0.0,  1.0,  1.0 ]';

  line_pointer(1:line_num+1) = [ 1, 6, 11, 13, 15, 17, 19 ];

  line_data(1:line_data_num) = [ ...
     1,  2,  3,  4,  1, ...
     5,  6,  7,  8,  5, ...
     1,  5, ...
     2,  6, ...
     3,  7, ...
     4,  8 ];

  return
end

function [ xyz, face_pointer, face_data ] = xyzf_example ( point_num, ...
  face_num, face_data_num )

%*****************************************************************************80
%
%% XYZF_EXAMPLE sets data suitable for a pair of XYZ and XYZF files.
%
%  Discussion:
%
%    There are 8 points.
%    There are 6 faces.
%    There are 24 face items.
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
%    07 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer  FACE_DATA_NUM, the number of face items.
%
%    Output, real XY(2,POINT_NUM), the point coordinates.
%
%    Output, integer FACE_POINTER(FACE_NUM+1), pointers to the
%    first face item for each face.
%
%    Output, integer FACE_DATA(FACE_DATA_NUM), indices
%    of points that form faces.
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

  face_pointer(1:face_num+1) = [ 1, 5, 9, 13, 17, 21, 25 ];

  face_data(1:face_data_num) = [ ...
     1, 4, 3, 2, ...
     2, 3, 7, 6, ...
     5, 6, 7, 8, ...
     5, 8, 4, 1, ...
     1, 2, 6, 5, ...
     3, 4, 8, 7 ];

  return
end

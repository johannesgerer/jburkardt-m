function [ point_num, face_num, face_data_num ] = xyzf_example_size ( )

%*****************************************************************************80
%
%% XYZF_EXAMPLE_SIZE sizes the data to be created by XYZF_EXAMPLE.
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
%    Output, integer POINT_NUM, the number of points.
%
%    Output, integer FACE_NUM, the number of faces.
%
%    Output, integer FACE_DATA_NUM, the number of face items.
%
  face_data_num = 24;
  face_num = 6;
  point_num = 8;

  return
end

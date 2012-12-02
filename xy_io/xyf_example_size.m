function [ point_num, face_num, face_data_num ] = xyf_example_size (  )

%*****************************************************************************80
%
%% XYF_EXAMPLE_SIZE sizes the data to be created by XYF_EXAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2009
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
  n_t = 13;
  n_r = 5;

  face_data_num = 4 * ( n_t - 1 ) * ( n_r - 1 );
  face_num = ( n_t - 1 ) * ( n_r - 1 );
  point_num = n_t * n_r;

  return
end

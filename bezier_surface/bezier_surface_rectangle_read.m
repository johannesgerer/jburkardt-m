function rectangle_node = bezier_surface_rectangle_read ( rectangle_file_name, ...
  rectangle_num )

%*****************************************************************************80
%
%% BEZIER_SURFACE_RECTANGLE_READ reads rectangles from a rectangle file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string RECTANGLE_FILE_NAME, the name of the
%    rectangle file.
%
%    Input, integer RECTANGLE_NUM, the number of rectangles.
%
%    Output, real RECTANGLE_NODE(16,RECTANGLE_NUM),
%    the nodes that make up each rectangle.
%
  dim_num = 16;

  rectangle_node = i4mat_data_read ( rectangle_file_name, dim_num, ...
    rectangle_num );

  return
end

function bezier_surface_rectangle_write ( rectangle_file_name, ...
  rectangle_num, rectangle_node )

%*****************************************************************************80
%
%% BEZIER_SURFACE_RECTANGLE_WRITE writes rectangle to a rectangle file.
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
%    Input, integer RECTANGLE_NUM, the number of rectangle.
%
%    Input, integer RECTANGLE_NODE(16,RECTANGLE_NUM), the nodes that
%    make up each rectangle.
%
  dim_num = 16;
  header = 1;

  i4mat_write ( rectangle_file_name, dim_num, rectangle_num, ...
    rectangle_node, header );

  return
end

function rectangle_num = bezier_surface_rectangle_size ( rectangle_file_name )

%*****************************************************************************80
%
%% BEZIER_SURFACE_RECTANGLE_SIZE counts rectangles in a rectangle file.
%
%  Discussion:
%
%    This version of the routine simply counts the number of lines
%    in the file (although it ignores comment lines beginning with "#").
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
%    Output, integer NODE_NUM, the number of rectangles.
%
  rectangle_num = file_row_count ( rectangle_file_name );

  return
end

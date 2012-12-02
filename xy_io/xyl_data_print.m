function xyl_data_write ( point_num, line_num, line_data_num, line_pointer, ...
  line_data )

%*****************************************************************************80
%
%% XYL_DATA_PRINT prints the data of an XYL file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2009
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
%    Input, integer LINE_POINTER(LINE_NUM+1), pointers to the
%    first line item for each line.
%
%    Input, integer LINE_DATA(LINE_DATA_NUM), indices
%    of points that form lines.
%
  fprintf ( 1, '\n' );
  for line = 1 : line_num
    fprintf ( 1, '  %4d  %8d  %8d\n', ...
      line,  line_pointer(line) : line_pointer(line+1) - 1 );
  end
  fprintf ( 1, '\n' );
  for line = 1 : line_num
    for i = line_pointer(line) : line_pointer(line+1) - 1
      fprintf ( 1, '  %d', line_data(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

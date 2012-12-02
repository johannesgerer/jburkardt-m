function xyl_write ( output_filename, point_num, line_num, line_data_num, ...
  line_pointer, line_data )

%*****************************************************************************80
%
%% XYL_WRITE writes an XYL file.
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
%    Input, string OUTPUT_FILENAME, the name of the file
%    to which the data should be written.
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

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYL_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_filename );
    error ( 'XYL_WRITE - Error!' );
  end
%
%  Write the header.
%
  xyl_header_write ( output_filename, output_unit, point_num, line_num, ...
    line_data_num );
%
%  Write the data.
%
  xyl_data_write ( output_unit, point_num, line_num, line_data_num, ...
    line_pointer, line_data );
%
%  Close the file.
%
  fclose ( output_unit );

  return
end

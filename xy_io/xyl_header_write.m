function xyl_header_write ( output_filename, output_unit, point_num, ...
  line_num, line_data_num )

%*****************************************************************************80
%
%% XYL_HEADER_WRITE writes the header of an XYL file.
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
%    Input, string OUTPUT_FILENAME, the name of the output file.
%
%    Input, integer OUTPUT_UNIT, the output file unit number.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer LINE_NUM, the number of lines.
%
%    Input, integer LINE_DATA_NUM, the number of line items.
%
  fprintf ( output_unit, '#  %s\n', output_filename );
  fprintf ( output_unit, '#  created by xy_io::xyl_header_write.m\n' );
  fprintf ( output_unit, '#\n');
  fprintf ( output_unit, '#  Number of points =     %d\n', point_num );
  fprintf ( output_unit, '#  Number of lines =      %d\n', line_num );
  fprintf ( output_unit, '#  Number of line items = %d\n', line_data_num );
  fprintf ( output_unit, '#\n' );

  return
end

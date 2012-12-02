function xy_header_write ( output_filename, output_unit, point_num )

%*****************************************************************************80
%
%% XY_HEADER_WRITE writes the header of an XY file.
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
%    Input, string OUTPUT_FILENAME, the name of the output file.
%
%    Input, integer OUTPUT_UNIT, the output file unit number.
%
%    Input, integer POINT_NUM, the number of points.
%
  fprintf ( output_unit, '#  %s\n', output_filename );
  fprintf ( output_unit, '#  created by xy_io::xy_header_write.m\n' );
  fprintf ( output_unit, '#\n');
  fprintf ( output_unit, '#  Number of points = %d\n', point_num );
  fprintf ( output_unit, '#\n' );

  return
end

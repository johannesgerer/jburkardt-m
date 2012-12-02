function xy_write ( output_filename, point_num, xy )

%*****************************************************************************80
%
%% XY_WRITE writes an XY file.
%
%  Example:
%
%    # my_file.xy
%    # created by XY_IO::XY_WRITE.
%    #
%    #  Number of points = 5
%    #
%    0.0  0.0
%    1.0  2.0
%    3.0  5.0
%    2.0  1.0
%    8.0  7.5
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
%    Input, string OUTPUT_FILENAME, the name of the file.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real XY(2,POINT_NUM), the point coordinates.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XY_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_filename );
    error ( 'XY_WRITE - Error!' );
  end
%
%  Write the header.
%
  xy_header_write ( output_filename, output_unit, point_num );
%
%  Write the data.
%
  xy_data_write ( output_unit, point_num, xy );
%
%  Close the file.
%
  fclose ( output_unit );

  return
end

function xyz_write ( output_filename, point_num, xyz )

%*****************************************************************************80
%
%% XY_WRITE writes an XY file.
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
%    Input, string OUTPUT_FILENAME, the name of the file
%    to which the data should be written.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real XYZ(3,POINT_NUM), the point coordinates.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZ_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_filename );
    error ( 'XYZ_WRITE - Error!' );
    return;
  end
%
%  Write the header.
%
  xyz_header_write ( output_filename, output_unit, point_num );
%
%  Write the data.
%
  xyz_data_write ( output_unit, point_num, xyz );
%
%  Close the file.
%
  fclose ( output_unit );

  return
end

function xy_write_test ( output_filename )

%*****************************************************************************80
%
%% XY_WRITE_TEST tests the XY_WRITE routine.
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
  point_num = 100;
%
%  Set the data.
%
  xy = xy_example ( point_num );
%
%  Write the data to the file.
%
  xy_write ( output_filename, point_num, xy );

  return
end

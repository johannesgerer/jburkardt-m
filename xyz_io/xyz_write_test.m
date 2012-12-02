function xyz_write_test ( file_out_name )

%*****************************************************************************80
%
%% XYZ_WRITE_TEST tests the XYZ write routines.
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
%    Input, string FILE_OUT_NAME, the name of the output file.
%
  point_num = xyz_example_size ( );
%
%  Set the data.
%
  xyz = xyz_example ( point_num );
%
%  Write the data to the file.
%
  xyz_write ( file_out_name, point_num, xyz );

  return
end

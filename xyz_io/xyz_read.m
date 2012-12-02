function [ point_num, xyz ] = xyz_read ( input_filename )

%*****************************************************************************80
%
%% XYZ_READ reads the header and data from an XYZ file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the file.
%
%    Output, integer POINT_NUM, the number of points.
%
%    Output, real XYZ(3,POINT_NUM), the point coordinates.
%

%
%  Read the header.
%
  point_num = xyz_header_read ( input_filename );
%
%  Read the data.
%
  xyz = xyz_data_read ( input_filename, point_num );

  return
end

function [ point_num, xy ] = xy_read ( input_filename )

%*****************************************************************************80
%
%% XY_READ reads the header and data from an XY file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2008
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
%    Output, real XY(2,POINT_NUM), the point coordinates.
%

%
%  Read the header.
%
  point_num = xy_header_read ( input_filename );
%
%  Read the data.
%
  xy = xy_data_read ( input_filename, point_num );

  return
end

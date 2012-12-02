function xyz_data_write ( output_unit, point_num, xyz )

%*****************************************************************************80
%
%% XYZ_DATA_WRITE writes the data of an XYZ file.
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
%    Input, integer OUTPUT_UNIT, the output file ID.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real XYZ(3,POINT_NUM), the point coordinates.
%
  for ( j = 1 : point_num )
    fprintf ( output_unit, '%14f  %14f  %14f\n', xyz(1:3,j) );
  end

  return
end

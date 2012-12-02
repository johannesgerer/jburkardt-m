function xy_data_write ( output_unit, point_num, xy )

%*****************************************************************************80
%
%% XY_DATA_WRITE writes the data of an XY file.
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
%    Input, real XY(2,POINT_NUM), the point coordinates.
%
  for ( j = 1 : point_num )
    fprintf ( output_unit, '%14f  %14f\n', xy(1:2,j) );
  end

  return
end

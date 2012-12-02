function xy_data_print ( point_num, xy )

%*****************************************************************************80
%
%% XY_DATA_PRINT prints the data of an XY file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real XY(2,POINT_NUM), the point coordinates.
%
  fprintf ( 1, '\n' );
  for ( j = 1 : point_num )
    fprintf ( 1, '%14f  %14f\n', xy(1:2,j) );
  end

  return
end

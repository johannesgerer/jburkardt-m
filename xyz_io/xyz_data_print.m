function xyz_data_print ( point_num, xyz )

%*****************************************************************************80
%
%% XYZ_DATA_PRINT prints the data of an XYZ file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real XYZ(3,POINT_NUM), the point coordinates.
%
  fprintf ( 1, '\n' );
  for ( j = 1 : point_num )
    fprintf ( 1, '%14f  %14f  %14f\n', xyz(1:3,j) );
  end

  return
end

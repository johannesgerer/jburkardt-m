function xy_header_print ( point_num )

%*****************************************************************************80
%
%% XY_HEADER_PRINT prints the header of an XY file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
  fprintf ( 1, '\n');
  fprintf ( 1, '  Number of points = %d\n', point_num );

  return
end

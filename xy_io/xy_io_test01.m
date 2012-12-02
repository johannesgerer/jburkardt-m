function xy_io_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests XY_EXAMPLE, XY_WRITE.
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
  point_num = 300;
  filename = 'xy_io_test01.xy';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  XY_EXAMPLE sets up sample XY data.\n' );
  fprintf ( 1, '  XY_WRITE writes an XY file.\n' );

  xy = xy_example ( point_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XY_EXAMPLE has created the data.\n' );

  xy_write ( filename, point_num, xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XY_WRITE wrote the header and data for %s\n', filename );
  fprintf ( 1, '  Number of points = %d\n', point_num );

  return
end

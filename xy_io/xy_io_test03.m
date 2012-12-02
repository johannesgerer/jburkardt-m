function xy_io_test03 ( )

%*****************************************************************************80
%
%% XY_IO_TEST03 tests XYL_EXAMPLE.
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
  xy_filename = 'house.xy';
  xyl_filename = 'house.xyl';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XY_IO_TEST03\n' );
  fprintf ( 1, '  XYL_EXAMPLE sets up XY and XYL data.\n' );

  [ point_num, line_num, line_data_num ] = xyl_example_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Example has:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points     = %d\n', point_num );
  fprintf ( 1, '  Number of lines      = %d\n', line_num );
  fprintf ( 1, '  Number of line items = %d\n', line_data_num );

  [ xy, line_pointer, line_data ] = xyl_example ( point_num, line_num, ...
    line_data_num );

  xy_write ( xy_filename, point_num, xy );

  xyl_write ( xyl_filename, point_num, line_num, line_data_num, ...
    line_pointer, line_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the XY file "%s".\n', xy_filename );
  fprintf ( 1, '  and the XYL file "%s"\n', xyl_filename ) ;

  return
end

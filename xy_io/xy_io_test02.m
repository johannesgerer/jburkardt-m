function xy_io_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests XY_READ.
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
  filename = 'xy_io_test02.xy';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  XY_READ reads an XY file.\n' );

  xy_write_test ( filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XY_WRITE_TEST created some data.\n' );

  point_num = xy_header_read ( filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XY_READ_HEADER has read the header.\n' );

  if ( point_num <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST02 - Fatal error!\n' );
    fprintf ( 1, '  Something is wrong, because POINT_NUM is not positive!\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points = %d\n', point_num );

  xy = xy_data_read ( filename, point_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XY_READ_DATA has read the data.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample data:\n' );
  fprintf ( 1, '\n' );

  for ( k = 1 : 10 )
    i = floor ( ( ( 10 - k ) * 1 + ( k - 1 ) * point_num ) / ( 10 - 1 ) );
    fprintf ( 1, '%4d %10f  %10f\n', i, xy(1,i), xy(2,i) );
  end

  return
end

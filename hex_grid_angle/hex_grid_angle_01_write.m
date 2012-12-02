function hex_grid_angle_01_write ( center, angle, h, n, r, file_out_name )

%*****************************************************************************80
%
%% HEX_GRID_ANGLE_01_WRITE writes an angled hex grid dataset to a file.
%
%  Discussion:
%
%    The initial lines of the file are comments, which begin with a
%    '#' character.
%
%    Thereafter, each line of the file contains the 2-dimensional
%    components of the next entry of the dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CENTER(2), the "center" of the grid.
%
%    Input, real ANGLE, the angle of the grid.
%
%    Input, real H, the spacing between points on a grid line.
%
%    Input, integer N, the number of elements in the subsequence.
%
%    Input, real R(2,N), the points.
%
%    Input, string FILE_OUT_NAME, the output file name.
%
  dim_num = 2;

  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEX_GRID_ANGLE_01_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '  "%s".\n', file_out_name );
    error ( 'HEX_GRID_ANGLE_01_WRITE - Fatal error!' );
  end

  fprintf ( file_out_unit, '#  %s\n', file_out_name );
  fprintf ( file_out_unit, '#  created by HEX_GRID_ANGLE_01_WRITE.M\n' );
  fprintf ( file_out_unit, '#\n' );
  fprintf ( file_out_unit, '#  DIM_NUM = %d\n', dim_num );
  fprintf ( file_out_unit, '#  N =       %d\n', n );
  fprintf ( file_out_unit, '#  CENTER =  %f  %f\n', center(1:dim_num) );
  fprintf ( file_out_unit, '#  ANGLE =   %f', angle );
  fprintf ( file_out_unit, '#  H =       %f', h );
  fprintf ( file_out_unit, '#  EPSILON = %f', r8_epsilon ( 'DUMMY' ) );
  fprintf ( file_out_unit, '#\n' );

  fprintf ( file_out_unit, '#\n' );

  for j = 1 : n
    for i = 1 : dim_num
      fprintf ( file_out_unit, '  %12f', r(i,j) );
    end
    fprintf ( file_out_unit, '\n' );
  end

  fclose ( file_out_unit );

  return
end

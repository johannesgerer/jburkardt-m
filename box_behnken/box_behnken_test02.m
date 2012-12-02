function box_behnken_test02 ( )

%*****************************************************************************80
%
%% BOX_BEHNKEN_TEST02 tests R8MAT_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2012
%
%  Author:
%
%    John Burkardt
%
  dim_num = 4;

  range = [ ...
    0.0, 0.0, 0.0, 0.0; ...
    1.0, 1.0, 1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_BEHNKEN_TEST02\n' );
  fprintf ( 1, '  R8MAT_WRITE writes a Box-Behnken dataset\n' );
  fprintf ( 1, '  to a file.\n' );

  r8mat_transpose_print ( dim_num, 2, range, '  The ranges:' );

  x_num = box_behnken_size ( dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  the Box-Behnken design is of size %d\n', x_num );

  x = box_behnken ( dim_num, x_num, range );

  file_out_name = 'box_behnken_04_33.txt';

  r8mat_write ( file_out_name, dim_num, x_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', file_out_name );

  return
end

function box_behnken_test01 ( )

%*****************************************************************************80
%
%% BOX_BEHNKEN_TEST01 tests BOX_BEHNKEN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  range = [ ...
    0.0, 10.0,  5.0; ...
    1.0, 11.0, 15.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_BEHNKEN_TEST01\n' );
  fprintf ( 1, '  BOX_BEHNKEN computes a Box-Behnken dataset.\n' );

  r8mat_transpose_print ( dim_num, 2, range, '  The ranges:' );

  x_num = box_behnken_size ( dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, ' the Box-Behnken design is of size %d\n', x_num );

  x = box_behnken ( dim_num, x_num, range );

  r8mat_transpose_print ( dim_num, x_num, x, '  The Box-Behnken design:' );

  return
end

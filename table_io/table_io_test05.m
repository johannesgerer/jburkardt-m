function table_io_test05 ( )

%*****************************************************************************80
%
%% TABLE_IO_TEST05 tests R8MAT_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  m = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  R8MAT_UNIFORM_01 sets a random R8MAT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N  = %d\n', n );

  table = r8mat_uniform_01 ( m, n, seed );

  r8mat_print_some ( m, n, table, 1, 1, 5, 10, ...
    '  5x10 portion of the data:' );

  return
end

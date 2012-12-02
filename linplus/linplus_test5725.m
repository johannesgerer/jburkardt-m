function linplus_test5725 ( )

%*****************************************************************************80
%
%% TEST5725 tests R8SP_READ, R8SP_READ_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  input_file = 'r8sp_matrix.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST535\n' );
  fprintf ( 1, '  For a R8SP system,\n' );
  fprintf ( 1, '  R8SP_READ_SIZE reads the size of the matrix.\n' );
  fprintf ( 1, '  R8SP_READ reads the matrix.\n' );

  [ m, n, nz_num ] = r8sp_read_size ( input_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8SP_READ_SIZE reports matrix size data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =          %d\n', m );
  fprintf ( 1, '  Matrix columns N =       %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );

  [ row, col, a ] = r8sp_read ( input_file, m, n, nz_num );

  r8sp_print_some ( m, n, nz_num, row, col, a, 1, 1, ...
    10, 10, '  Initial 10x10 block of recovered R8SP matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Deleting the matrix data file "%s"\n', input_file );

  return
end

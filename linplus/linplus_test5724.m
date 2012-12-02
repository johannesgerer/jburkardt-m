function linplus_test5724 ( )

%*****************************************************************************80
%
%% TEST5724 tests R8SP_WRITE.
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
  m = 100;
  n = 100;
  nz_num = 3 * n - 2;
  output_file = 'r8sp_matrix.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST5724\n' );
  fprintf ( 1, '  For a R8SP system,\n' );
  fprintf ( 1, '  R8SP_WRITE writes the matrix to a file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =          %d\n', m );
  fprintf ( 1, '  Matrix columns N =       %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );
%
%  Set the matrix values.
%
  k = 0;
  for i = 1 : n
    k = k + 1;
    j = i;
    row(k) = i;
    col(k) = j;
    a(k) = 100 * i + j;
  end

  for i = 2 : n
    j = i - 1;
    k = k + 1;
    row(k) = i;
    col(k) = j;
    a(k) = 100 * i + j;
  end

  for i = 1 : n-1
    j = i + 1;
    k = k + 1;
    row(k) = i;
    col(k) = j;
    a(k) = 100 * i + j;
  end

  r8sp_print_some ( m, n, nz_num, row, col, a, 1, 1, ...
    10, 10, '  Initial 10x10 block of R8SP matrix:' );

  r8sp_write ( m, n, nz_num, row, col, a, output_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8SP_WRITE wrote the matrix data to "%s"\n.', ...
    output_file );

  return
end

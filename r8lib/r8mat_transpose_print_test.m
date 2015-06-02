function r8mat_transpose_print_test ( )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT_TEST tests R8MAT_TRANSPOSE_PRINT;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 7;
  n = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_TRANSPOSE_PRINT_TEST\n' );
  fprintf ( 1, '  R8MAT_TRANSPOSE_PRINT prints a R8MAT,\n' );
  fprintf ( 1, '  transposed.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix row order M =    %d\n', m );
  fprintf ( 1, '  Matrix column order N = %d\n', n );
%
%  Set the matrix.
%
  for i = 1 : m
    for j = 1 : n
      a(i,j) = i * 100 + j;
    end
  end

  r8mat_transpose_print ( m, n, a, '  The transposed matrix A:' );

  return
end

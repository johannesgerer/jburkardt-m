function i4lib_test40 ( )

%*****************************************************************************80
%
%% TEST40 tests I4ROW_SWAP;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST40\n' );
  fprintf ( 1, '  For an integer matrix of rows,\n' );
  fprintf ( 1, '  I4ROW_SWAP swaps two rows;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  i4mat_print ( m, n, a, '  The matrix:' );

  row1 = 1;
  row2 = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Swap rows %d and %d\n', row1, row2 );
  fprintf ( 1, '\n' );

  a = i4row_swap ( m, n, a, row1, row2 );

  i4mat_print ( m, n, a, '  The new matrix:' );

  return
end

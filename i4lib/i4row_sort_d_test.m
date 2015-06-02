function i4row_sort_d_test ( )

%*****************************************************************************80
%
%% I4ROW_SORT_D_TEST tests I4ROW_SORT_D.
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
  m = 6;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4ROW_SORT_D_TEST\n' );
  fprintf ( 1, '  For a rectangular integer matrix:\n' );
  fprintf ( 1, '  I4ROW_SORT_D sorts the rows;\n' );
 
  seed = 123456789;

  for i = 1 : m
    for j = 1 : n
      a(i,j) = 10 * i + j;
    end
  end

  i4mat_print ( m, n, a, '  The original matrix:' );

  [ a, seed ] = i4mat_perm2_uniform ( m, n, a, seed );

  i4mat_print ( m, n, a, '  The matrix, permuted by I4MAT_PERM2_UNIFORM:' );

  a = i4row_sort_d ( m, n, a );

  i4mat_print ( m, n, a, '  The row-sorted matrix:' );

  a = i4row_sort2_d ( m, n, a );

  i4mat_print ( m, n, a, '  The element-sorted row-sorted matrix:' );

  return
end

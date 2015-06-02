function i4row_sort_a_test ( )

%*****************************************************************************80
%
%% I4ROW_SORT_A_TEST tests I4ROW_SORT_A;
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
  m = 10;
  n = 4;
  b = 0;
  c = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4ROW_SORT_A_TEST\n' );
  fprintf ( 1, '  For a rectangular integer matrix:\n' );
  fprintf ( 1, '  I4ROW_SORT_A sorts the rows;\n' );

  seed = 123456789;

  [ a, seed ] = i4mat_uniform_ab ( m, n, b, c, seed );

  i4mat_print ( m, n, a, '  The original matrix:' );

  a = i4row_sort_a ( m, n, a );

  i4mat_print ( m, n, a, '  The row-sorted matrix:' );

  return
end

function subset_test0689 ( )

%*****************************************************************************80
%
%% TEST0689 tests I4VEC_SORT_HEAP_INDEX_D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0689\n' );
  fprintf ( 1, '  I4VEC_SORT_HEAP_INDEX_D descending index-sorts\n' );
  fprintf ( 1, '    an integer vector using heap sort.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform ( n, 0, 3*n, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  indx = i4vec_sort_heap_index_d ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  INDX  A(INDX)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %4d  %4d\n', i, indx(i), a(indx(i)) );
  end

  return
end

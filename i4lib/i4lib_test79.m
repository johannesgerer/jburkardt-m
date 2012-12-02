function i4lib_test79 (  )

%*****************************************************************************80
%
%% TEST79 tests I4VEC_SORT_HEAP_INDEX_D.
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
  fprintf ( 1, 'TEST79\n' );
  fprintf ( 1, '  I4VEC_SORT_HEAP_INDEX_D creates a descending\n' );
  fprintf ( 1, '  sort index for an integer array.\n' );

  seed = 123456789;
  b = 0;
  c = 3 * n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  indx = i4vec_sort_heap_index_d ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After indexed descending sort:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %8d  %8d  %8d\n', i, indx(i), a(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use the index array to carry out the\n' );
  fprintf ( 1, '  permutation implicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %8d  %8d  %8d\n', i, indx(i), a(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call I4VEC_PERMUTE to carry out the permutation\n' );
  fprintf ( 1, '  explicitly.\n' );

  a = i4vec_permute ( n, a, indx );

  i4vec_print ( n, a, '  I, A(I)' );

  return
end

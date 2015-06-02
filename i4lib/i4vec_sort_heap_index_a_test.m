function i4vec_sort_heap_index_a_test ( )

%*****************************************************************************80
%
%% I4vEC_SORT_HEAP_INDEX_A_TEST tests I4VEC_SORT_HEAP_INDEX_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4vEC_SORT_HEAP_INDEX_A_TEST\n' );
  fprintf ( 1, '  I4VEC_SORT_HEAP_INDEX_A creates an ascending\n' );
  fprintf ( 1, '  sort index for an I4VEC.\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, 0, 3 * n, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  indx = i4vec_sort_heap_index_a ( n, a );

  i4vec_print ( n, indx, '  Sort vector INDX:' )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%8d  %8d  %8d\n', i, indx(i), a(indx(i)) );
  end

  return
end

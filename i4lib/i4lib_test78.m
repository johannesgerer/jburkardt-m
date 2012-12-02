function subpak_test78 ( )

%*****************************************************************************80
%
%% SUBPAK_TEST78 tests I4VEC_SORT_HEAP_INDEX_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 October 2008
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBPAK_TEST78\n' );
  fprintf ( 1, '  I4VEC_SORT_HEAP_INDEX_A creates an ascending\n' );
  fprintf ( 1, '  sort index for an I4VEC.\n' );

  seed = get_seed ( );

  [ a, seed ] = i4vec_uniform_ab ( n, 0, 3 * n, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  indx = i4vec_sort_heap_index_a ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After indexed ascending sort:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%8d  %8d  %8d\n', i, indx(i), a(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use the index array to carry out the\n' );
  fprintf ( 1, '  permutation implicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%8d  %8d  %8d\n', i, indx(i), a(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call I4VEC_PERMUTE to carry out the permutation\n' );
  fprintf ( 1, '  explicitly.\n' );
  fprintf ( 1, '\n' );

  a = i4vec_permute ( n, a, indx );

  i4vec_print ( n, a, '  I, A(I)' );

  return
end

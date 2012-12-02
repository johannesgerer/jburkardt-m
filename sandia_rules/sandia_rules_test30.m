function sandia_rules_test30 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST30 tests R8VEC_SORT_HEAP_INDEX_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2010
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST30\n' );
  fprintf ( 1, '  R8VEC_SORT_HEAP_INDEX_A creates an ascending\n' );
  fprintf ( 1, '  sort index for a R8VEC.\n' );

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_01 ( n, seed );

  r8vec_print ( n, a, '  The unsorted array:' );

  indx = r8vec_sort_heap_index_a ( n, a );

  i4vec_print ( n, indx, '  The index vector:' );

  b(1:n) = a(indx(1:n));

  r8vec_print ( n, b, '  The sorted array A(INDX(:)):' );

  return
end

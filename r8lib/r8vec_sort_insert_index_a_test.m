function r8vec_sort_insert_index_a_test ( )

%*****************************************************************************80
%
%% R8VEC_SORT_INSERT_INDEX_A_TEST tests R8VEC_SORT_INSERT_INDEX_A.
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
  fprintf ( 1, 'R8VEC_SORT_INSERT_INDEX_A_TEST\n' );
  fprintf ( 1, '  R8VEC_SORT_INSERT_INDEX_A creates an ascending\n' );
  fprintf ( 1, '  sort index for an R8VEC.\n' );

  b = 0.0;
  c = 3.0 * n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  r8vec_print_some ( n, a, 1, 10, '  Unsorted array:' );

  indx = r8vec_sort_insert_index_a ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After indexed ascending sort:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %12f\n', i, indx(i), a(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use the index array to carry out the\n' );
  fprintf ( 1, '  permutation implicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %12f\n', i, indx(i), a(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call R8VEC_PERMUTE to carry out the permutation explicitly.\n' );

  a = r8vec_permute ( n, a, indx );

  r8vec_print_some ( n, a, 1, 10, '  Permuted data' );

  return
end

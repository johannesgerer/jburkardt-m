function i4vec_sort_insert_a_test (  )

%*****************************************************************************80
%
%% I4VEC_SORT_INSERT_A_TEST tests I4VEC_SORT_INSERT_A.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_SORT_INSERT_A_TEST\n' );
  fprintf ( 1, '  I4VEC_SORT_INSERT_A sorts an integer array.\n' );

  seed = 123456789;
  b = 0;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  a = i4vec_sort_insert_a ( n, a );

  i4vec_print ( n, a, '  Sorted array:' );

  return
end

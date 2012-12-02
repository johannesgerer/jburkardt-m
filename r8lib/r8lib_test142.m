function r8lib_test142 ( )

%*****************************************************************************80
%
%% TEST142 tests R8VEC_SORT_INSERT_A.
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
  fprintf ( 1, 'TEST142\n' );
  fprintf ( 1, '  R8VEC_SORT_INSERT_A ascending sorts an R8VEC.\n' );

  b = 0.0;
  c = 3.0 * n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  r8vec_print_some ( n, a, 1, 10, '  Unsorted array:' );

  a = r8vec_sort_insert_a ( n, a );

  r8vec_print_some ( n, a, 1, 10, '  Sorted array:' );

  return
end

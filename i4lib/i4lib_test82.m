function i4lib_test82 (  )

%*****************************************************************************80
%
%% TEST82 tests I4VEC_SORT_SHELL_A.
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
  fprintf ( 1, 'TEST82\n' );
  fprintf ( 1, '  I4VEC_SORT_SHELL_A sorts an integer vector\n' );
  fprintf ( 1, '  using Shell''s sort.\n' );

  seed = 123456789;
  b = 0;
  c = 3 * n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  a = i4vec_sort_shell_a ( n, a );

  i4vec_print ( n, a, '  Sorted array:' );

  return
end

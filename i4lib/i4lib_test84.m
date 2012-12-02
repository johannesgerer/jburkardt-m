function i4lib_test84 (  )

%*****************************************************************************80
%
%% TEST84 tests I4VEC_SORTED_UNIQUE.
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
  b = 0;
  c = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST84\n' );
  fprintf ( 1, '  I4VEC_SORTED_UNIQUE finds unique entries in a sorted array.\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  a = i4vec_sort_heap_a ( n, a );

  i4vec_print ( n, a, '  Input vector:' );

  [ unique_num, a_unique ] = i4vec_sorted_unique ( n, a );

  i4vec_print ( unique_num, a_unique, '  Unique entries:' );

  return
end

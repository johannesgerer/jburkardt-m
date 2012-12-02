function r8lib_test145 ( )

%*****************************************************************************80
%
%% TEST145 tests R8VEC_SORTED_MERGE_A;
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
  na = 10;
  nb = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST145\n' );
  fprintf ( 1, '  For ascending order:\n' );
  fprintf ( 1, '  R8VEC_SORTED_MERGE_A merges two sorted DVEC''s;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = r8vec_uniform_01 ( na, seed );
  [ b, seed ] = r8vec_uniform_01 ( nb, seed );
 
  a = r8vec_sort_heap_a ( na, a );
 
  b = r8vec_sort_heap_a ( nb, b );

  r8vec_print ( na, a, '  Sorted vector A:' );

  r8vec_print ( nb, b, '  Sorted vector B:' );
 
  [ nc, c ] = r8vec_sorted_merge_a ( na, a, nb, b );

  r8vec_print ( nc, c, '  Merged vector C:' );

  return
end

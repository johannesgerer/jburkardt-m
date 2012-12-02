function r8lib_test147 ( )

%*****************************************************************************80
%
%% TEST147 tests R8VEC_SORTED_SPLIT and R8VEC_SPLIT.
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
  n = 25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST147\n' );
  fprintf ( 1, '  R8VEC_SORTED_SPLIT splits a sorted vector into\n' );
  fprintf ( 1, '    entries less than and greater than a\n' );
  fprintf ( 1, '    splitting value.\n' );
  fprintf ( 1, '  R8VEC_SPLIT splits an unsorted vector\n' );
  fprintf ( 1, '    in the same way.\n' );

  b = 0.0;
  c = 10.0;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  a(1:n) = round ( a(1:n) ) / 2.0;

  a = r8vec_sort_heap_a ( n, a );

  split = 0.5 * ( a(1) + a(n) );

  r8vec_print ( n, a, '  The sorted array:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Splitting value is %f\n', split );

  [ i_lt, i_gt ] = r8vec_sorted_split ( n, a, split );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lower index I_LT = %d\n', i_lt );
  fprintf ( 1, '  Upper index I_GT = %d\n', i_gt );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now repeat test with R8VEC_SPLIT.\n' );

  [ a, seed ] = r8vec_permute_uniform ( n, a, seed );
 
  r8vec_print ( n, a, '  The shuffled array:' );
 
  [ a, isplit ] = r8vec_split ( n, a, split );
 
  r8vec_print ( n, a, '  The split array:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Array entries <= SPLIT up to index %d\n', isplit );

  return
end

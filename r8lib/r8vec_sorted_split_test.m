function r8vec_sorted_split_test ( )

%*****************************************************************************80
%
%% R8VEC_SORTED_SPLIT_TEST tests R8VEC_SORTED_SPLIT.
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
  fprintf ( 1, 'R8VEC_SORTED_SPLIT_TEST\n' );
  fprintf ( 1, '  R8VEC_SORTED_SPLIT splits a sorted vector into\n' );
  fprintf ( 1, '  entries less than and greater than a\n' );
  fprintf ( 1, '  splitting value.\n' );

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

  return
end

function r8lib_test156 ( )

%*****************************************************************************80
%
%% R8LIB_TEST156 tests R8VEC2_SORTED_UNIQUE_INDEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST156\n' );
  fprintf ( 1, '  For a pair of R8VEC''s:\n' );
  fprintf ( 1, '  R8VEC2_SORTED_UNIQUE_INDEX indexes unique entries.\n' );

  b = 1.0;
  c = 3.0;
  seed = 123456789;

  [ a1, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  b = 5.0;
  c = 10.0;

  [ a2, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  a1(3) = a1(1);
  a2(3) = a2(1);

  a1(6) = a1(2);
  a2(6) = a2(2);

  a1(9) = a1(1);
  a2(9) = a2(1);

  [ a1, a2 ] = r8vec2_sort_a ( n, a1, a2 );

  r8vec2_print ( n, a1, a2, '  Sorted arrays:' );

  [ unique_num, indx ] = r8vec2_sorted_unique_index ( n, a1, a2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of unique elements is %d\n', unique_num );

  i4vec_print ( unique_num, indx, '  Index of Unique Elements:' );

  a1 = r8vec_index_order ( unique_num, a1, indx );
  a2 = r8vec_index_order ( unique_num, a2, indx );

  r8vec2_print ( unique_num, a1, a2, '  After Indexed Nonunique Deletion.' );

  return
end

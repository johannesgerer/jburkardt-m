function i4lib_test75 ( )

%*****************************************************************************80
%
%% TEST75 tests I4VEC_SORT_BUBBLE_A and I4VEC_SORTED_UNIQUE_HIST.
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
  n = 20;
  b = 0;
  c = 3 * n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST75\n' );
  fprintf ( 1, '  For a vector of integers,\n' );
  fprintf ( 1, '  I4VEC_SORT_BUBBLE_A ascending sorts,\n' );
  fprintf ( 1, '  I4VEC_SORTED_UNIQUE_HIST makes a histogram\n' );
  fprintf ( 1, '  of unique entries.\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Unsorted:' );

  a = i4vec_sort_bubble_a ( n, a );

  i4vec_print ( n, a, '  Ascending sorted:' );

  [ unique_num, auniq, acount ] = i4vec_sorted_unique_hist ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are %d unique entries.\n', unique_num );

  i4vec2_print ( unique_num, auniq, acount, '  Value and Multiplicity' );

  return
end

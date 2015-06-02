function i4vec_sorted_unique_hist_test ( )

%*****************************************************************************80
%
%% I4VEC_SORTED_UNIQUE_HIST_TEST tests I4VEC_SORTED_UNIQUE_HIST.
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
  fprintf ( 1, 'I4VEC_SORTED_UNIQUE_HIST_TEST\n' );
  fprintf ( 1, '  For a vector of integers,\n' );
  fprintf ( 1, '  I4VEC_SORTED_UNIQUE_HIST makes a histogram\n' );
  fprintf ( 1, '  of unique entries.\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  a = i4vec_sort_bubble_a ( n, a );

  i4vec_print ( n, a, '  Ascending sorted array:' );

  [ unique_num, auniq, acount ] = i4vec_sorted_unique_hist ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are %d unique entries.\n', unique_num );

  i4vec2_print ( unique_num, auniq, acount, '  Value and Multiplicity' );

  return
end

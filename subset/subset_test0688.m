function subset_test0688 ( )

%*****************************************************************************80
%
%% TEST0688 tests I4VEC_SORT_BUBBLE_A.
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
  fprintf ( 1, 'TEST0688\n' );
  fprintf ( 1, '  I4VEC_SORT_BUBBLE_A ascending sorts an integer vector\n' );
  fprintf ( 1, '    using bubble sort.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform ( n, 0, 3*n, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  a = i4vec_sort_bubble_a ( n, a );

  i4vec_print ( n, a, '  Sorted array:' );

  return
end

function r8vec_sort_quick_a_test ( )

%*****************************************************************************80
%
%% R8VEC_SORT_QUICK_A_TEST tests R8VEC_SORT_QUICK_A.
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
  fprintf ( 1, 'R8VEC_SORT_QUICK_A_TEST\n' );
  fprintf ( 1, '  R8VEC_SORT_QUICK_A sorts an R8VEC\n' );
  fprintf ( 1, '  using quick sort.\n' );

  b = 0.0;
  c = 10.0;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Unsorted array:' );

  a = r8vec_sort_quick_a ( n, a );

  r8vec_print ( n, a, '  Sorted array:' );

  return
end

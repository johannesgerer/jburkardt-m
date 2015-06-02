function r8vec_sort_bubble_a_test ( )

%*****************************************************************************80
%
%% R8VEC_SORT_BUBBLE_A_TEST tests R8VEC_SORT_BUBBLE_A.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_SORT_BUBBLE_A_TEST\n' );
  fprintf ( 1, '  R8VEC_SORT_BUBBLE_A ascending sorts a real vector.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, 0.0, 3.0 * n, seed );

  r8vec_print_some ( n, a, 1, 10, '  Original array:' );

  a = r8vec_sort_bubble_a ( n, a );

  r8vec_print_some ( n, a, 1, 10, '  Ascending sorted array:' );

  return
end

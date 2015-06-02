function r8vec_sorted_nearest_test ( )

%*****************************************************************************80
%
%% R8VEC_SORTED_NEAREST_TEST tests R8VEC_SORTED_NEAREST.
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
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_SORTED_NEAREST_TEST\n' );
  fprintf ( 1, '  R8VEC_SORTED_NEAREST finds the nearest entry\n' );
  fprintf ( 1, '  in a sorted real array.\n' );

  [ x, seed ] = r8vec_uniform_ab ( n, 0.0, 10.0, seed );

  x = r8vec_sort_heap_a ( n, x );

  r8vec_print ( n, x, '  Sorted array:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Test        Nearest\n' );
  fprintf ( 1, '     Value    Index   Value\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ xval, seed ] = r8_uniform_ab ( 0.0, 10.0, seed );

    j = r8vec_sorted_nearest ( n, x, xval );

    fprintf ( 1, '  %8f    %6d  %8f\n', xval, j, x(j) );

  end

  return
end

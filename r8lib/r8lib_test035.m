function r8lib_test035 ( )

%*****************************************************************************80
%
%% R8LIB_TEST035 tests R82VEC_SORT_QUICK_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 12;

  b = 0.0;
  c = 10.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST035\n' );
  fprintf ( 1, '  R82VEC_SORT_QUICK_A sorts an R82VEC\n' );
  fprintf ( 1, '  using quick sort.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = r8mat_uniform_ab ( 2, n, b, c, seed );
%
%  Give a few elements the same first component.
%
  a(1,3) = a(1,5);
  a(1,4) = a(1,12);
%
%  Give a few elements the same second component.
%
  a(2,6) = a(2,1);
  a(2,2) = a(2,9);
%
%  Make two entries equal.
%
  a(1:2,7) = a(1:2,11);

  r82vec_print ( n, a, '  Before rearrangement:' );

  a = r82vec_sort_quick_a ( n, a );

  r82vec_print ( n, a, '  Sorted array:' );

  return
end

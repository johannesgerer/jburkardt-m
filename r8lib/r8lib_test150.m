function r8lib_test150 ( )

%*****************************************************************************80
%
%% R8LIB_TEST150 tests R8VEC_SORTED_UNIQUE_HIST.
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
  n = 30;
  tol = 0.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST150\n' );
  fprintf ( 1, '  R8VEC_SORTED_UNIQUE_HIST makes a historgram of\n' );
  fprintf ( 1, '  the unique entries in a real vector.\n' );
 
  b = 0.0;
  c = n;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using random number seed %d\n', seed );

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  a(1:n) = round ( a(1:n) ) + 0.5;

  r8vec_print ( n, a, '  Unsorted array:' );

  a = r8vec_sort_bubble_a ( n, a );

  r8vec_print ( n, a, '  Ascending sorted array:' );

  [ unique_num, auniq, acount ] = r8vec_sorted_unique_hist ( n, a, tol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8VEC_SORTED_UNIQUE_HIST counts %d unique entries.\n', ...
    unique_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Value  Multiplicity\n' );
  fprintf ( 1, '\n' );
  for i = 1 : unique_num
    fprintf ( 1, '  %6d  %12f  %6d\n', i, auniq(i), acount(i) );
  end

  return
end

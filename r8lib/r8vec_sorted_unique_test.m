function r8vec_sorted_unique_test ( )

%*****************************************************************************80
%
%% R8VEC_SORTED_UNIQUE_TEST tests R8VEC_SORTED_UNIQUE;
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
  n = 30;
  tol = 0.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_SORTED_UNIQUE_TEST\n' );
  fprintf ( 1, '  R8VEC_SORTED_UNIQUE finds the unique entries in\n' );
  fprintf ( 1, '  a sorted R8VEC;\n' );

  b = 0.0;
  c = n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  a(1:n) = floor ( a(1:n) );

  r8vec_print_some ( n, a, 1, 10, '  Unsorted array:' );

  a = r8vec_sort_heap_a ( n, a );
 
  [ unique_num, a ] = r8vec_sorted_unique ( n, a, tol );
 
  r8vec_print ( unique_num, a, '  Unique entries' );

  return
end

function combo_test10 ( )

%*****************************************************************************80
%
%% COMBO_TEST10 tests I4VEC_SEARCH_BINARY_D and I4VEC_SORT_INSERT_D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST10\n' );
  fprintf ( 1, '  Integer vectors:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I4VEC_SORT_INSERT_D descending sorts;\n' );
  fprintf ( 1, '  I4VEC_SEARCH_BINARY_D searches a descending \n' );
  fprintf ( 1, '  sorted vector.\n' );

  a(1:n) = [ 6, 7, 1, 0, 4, 3, 2, 1, 5, 8 ]';

  i4vec_print ( n, a, '  Before descending sort:' );

  a = i4vec_sort_insert_d ( n, a );

  i4vec_print ( n, a, '  After descending sort:' );

  b = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now search for an instance of the value %d\n', b );

  index = i4vec_search_binary_d ( n, a, b );

  fprintf ( 1, '\n' );
  if ( index == 0 )
    fprintf ( 1, '  The value does not occur.\n' );
  else
    fprintf ( 1, '  The value occurs at index = %d\n', index );
  end

  return
end

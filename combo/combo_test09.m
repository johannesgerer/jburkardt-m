function combo_test09 ( )

%*****************************************************************************80
%
%% COMBO_TEST09 tests I4VEC_SEARCH_BINARY_A and I4VEC_SORT_INSERT_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST09\n' );
  fprintf ( 1, '  Integer vectors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I4VEC_SORT_INSERT_A ascending sorts;\n' );
  fprintf ( 1, '  I4VEC_SEARCH_BINARY_A searches a ascending sorted vector.\n' );

  a(1:n) = [ 6, 7, 1, 0, 4, 3, 2, 1, 5, 8 ]';

  i4vec_print ( n, a, '  Before ascending sort:' );

  a = i4vec_sort_insert_a ( n, a );

  i4vec_print ( n, a, '  After ascending sort:' );

  b = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now search for an instance of the value %d\n', b );

  index = i4vec_search_binary_a ( n, a, b );

  fprintf ( 1, '\n' );
  if ( index == 0 )
    fprintf ( 1, '  The value does not occur.\n' );
  else
    fprintf ( 1, '  The value occurs at index = %d\n', index );
  end

  return
end

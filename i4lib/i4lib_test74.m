function i4lib_test74 ( )

%*****************************************************************************80
%
%% TEST74 tests I4VEC_SEARCH_BINARY_A;
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
  fprintf ( 1, 'TEST74\n' );
  fprintf ( 1, '  For ascending order:\n' );
  fprintf ( 1, '  I4VEC_SEARCH_BINARY_A searchs an array for a value;\n' );

  seed = 123456789;

  b = 0;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  search_val = a(1);

  a = i4vec_sort_heap_a ( n, a );

  i4vec_print ( n, a, '  Input vector A:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Search the array A for the value %d\n', search_val );

  index = i4vec_search_binary_a ( n, a, search_val );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEARCH RESULT:\n' );
  if ( 0 < index )
    fprintf ( 1, '    The value occurs in index %d\n', index );
  else
    fprintf ( 1, '    The value does not occur in the array.\n' );
  end

  return
end

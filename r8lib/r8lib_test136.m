function r8lib_test136 ()

%*****************************************************************************80
%
%% TEST136 tests R8VEC_SEARCH_BINARY_A;
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
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST136\n' );
  fprintf ( 1, '  For ascending order:\n' );
  fprintf ( 1, '  R8VEC_SEARCH_BINARY_A searches a sorted array;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = r8vec_uniform_01 ( n, seed );

  search_val = a(1);
 
  a = r8vec_sort_heap_a ( n, a );
 
  r8vec_print ( n, a, '  Sorted vector A:' );
%
%  Now search the sorted array for a given value.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Search the array for the value %f\n', search_val );

  index = r8vec_search_binary_a ( n, a, search_val );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEARCH RESULT:\n' );
  fprintf ( 1, '\n' );

  if ( 0 < index )
    fprintf ( 1, '    The value occurs in index %d\n', index );
  else
    fprintf ( 1, '    The value does not occur in the array.\n' );
  end

  return
end

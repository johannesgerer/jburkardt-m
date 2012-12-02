function i4lib_test55 ( )

%*****************************************************************************80
%
%% TEST55 tests I4VEC_HEAP_A and I4VEC_HEAP_D.
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
  b = 0;
  c = n;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST55\n' );
  fprintf ( 1, '  For an integer vector,\n' );
  fprintf ( 1, '  I4VEC_HEAP_A puts into ascending heap form.\n' );
  fprintf ( 1, '  I4VEC_HEAP_D puts into descending heap form.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  a = i4vec_heap_a ( n, a );
 
  i4vec_print ( n, a, '  Ascending heap form:' );
 
  a = i4vec_heap_d ( n, a );
 
  i4vec_print ( n, a, '  Descending heap form:' );

  return
end

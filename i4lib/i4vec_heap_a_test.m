function i4vec_heap_a_test ( )

%*****************************************************************************80
%
%% I4VEC_HEAP_A_TEST tests I4VEC_HEAP_A.
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
  fprintf ( 1, 'I4VEC_HEAP_A_TEST\n' );
  fprintf ( 1, '  For an integer vector,\n' );
  fprintf ( 1, '  I4VEC_HEAP_A puts into ascending heap form.\n' );

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  a = i4vec_heap_a ( n, a );
 
  i4vec_print ( n, a, '  Ascending heap form:' );
 
  return
end

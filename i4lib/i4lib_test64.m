function i4lib_test64 ( )

%*****************************************************************************80
%
%% TEST64 tests I4VEC_MERGE_A;
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
  n1 = 10;
  n2 = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST64\n' );
  fprintf ( 1, '  For ascending order:\n' );
  fprintf ( 1, '  I4VEC_MERGE_A merges two sorted integer arrays;\n' );
 
  seed = 123456789;
  b = 0;
  c = n1;

  [ a1, seed ] = i4vec_uniform_ab ( n1, b, c, seed );
 
  search_val = a1(1);

  a1 = i4vec_sort_heap_a ( n1, a1 );
 
  b = 0;
  c = n2;

  [ a2, seed ] = i4vec_uniform_ab ( n2, b, c, seed );
 
  a2 = i4vec_sort_heap_a ( n2, a2 );
 
  i4vec_print ( n1, a1, '  Input vector A1:' );

  i4vec_print ( n2, a2, '  Input vector A2:' );
 
  [ n3, a3 ] = i4vec_merge_a ( n1, a1, n2, a2 );

  i4vec_print ( n3, a3, '  Merged vector A3:' );

  return
end

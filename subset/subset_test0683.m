function subset_test0683 ( )

%*****************************************************************************80
%
%% TEST0683 tests I4VEC_INDEX;
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
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0683\n' );
  fprintf ( 1, '  I4VEC_INDEX returns the index of the first occurrence\n' );
  fprintf ( 1, '  of a given value in an integer vector.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform ( n, 1, n/2, seed );

  aval = a(floor(n/2));

  i4vec_print ( n, a, '  The integer array to search:' );
 
  first = i4vec_index ( n, a, aval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The value searched for is %d\n', aval );
  fprintf ( 1, '  The index of first occurrence is %d\n', first );

  return
end

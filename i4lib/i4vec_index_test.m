function i4vec_index_test ( )

%*****************************************************************************80
%
%% I4VEC_INDEX_TEST tests I4VEC_INDEX;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_INDEX_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_INDEX:              first index of given value;\n' );

  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  aval = a(floor(n/2));
  fprintf ( 1, '\n' );
  j = i4vec_index ( n, a, aval );
  fprintf ( 1, '  Index of first occurrence of %d is %d\n', aval, j );

  aval = aval + 1;
  j = i4vec_index ( n, a, aval );
  fprintf ( 1, '  Index of first occurrence of %d is %d\n', aval, j );

  return
end

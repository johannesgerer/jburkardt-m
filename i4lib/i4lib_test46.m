function i4lib_test46 ( )

%*****************************************************************************80
%
%% TEST46 tests I4VEC_MAX_INDEX, I4VEC_MAX_INDEX_LAST and I4VEC_INDEX;
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
  fprintf ( 1, 'TEST46\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_MAX_INDEX:          a maximal index;\n' );
  fprintf ( 1, '  I4VEC_MAX_INDEX_LAST:     last maximal index;\n' );
  fprintf ( 1, '  I4VEC_INDEX:              first index of given value;\n' );

  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  ival = i4vec_max_index ( n, a );
  fprintf ( 1, '  Maximum index: %d\n', ival );
  ival = i4vec_max_index_last ( n, a );
  fprintf ( 1, '  Last maximum index: %d\n', ival );

  ival = i4vec_min_index ( n, a );
  fprintf ( 1, '  Minimum index: %d\n', ival );

  aval = a(floor(n/2));
  fprintf ( 1, '\n' );
  j = i4vec_index ( n, a, aval );
  fprintf ( 1, '  Index of first occurrence of %d is %d\n', aval, j );

  aval = aval + 1;
  j = i4vec_index ( n, a, aval );
  fprintf ( 1, '  Index of first occurrence of %d is %d\n', aval, j );

  return
end

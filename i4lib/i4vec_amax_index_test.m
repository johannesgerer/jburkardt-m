function i4vec_amax_index_test ( )

%*****************************************************************************80
%
%% I4VEC_AMAX_INDEX_TEST tests I4VEC_AMAX_INDEX.
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
  fprintf ( 1, 'I4VEC_AMAX_INDEX_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_AMAX_INDEX:  index of maximum absolute entry;\n' );
 
  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  ival = i4vec_amax_index ( n, a );

  fprintf ( 1, '  Maximum abs index: %d\n', ival );

  return
end

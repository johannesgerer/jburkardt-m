function i4vec_nonzero_count_test ( )

%*****************************************************************************80
%
%% I4VEC_NONZERO_COUNT_TEST tests I4VEC_NONZERO_COUNT.
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
  fprintf ( 1, 'I4VEC_NONZERO_COUNT_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_NONZERO_COUNT: number of nonzeroes;\n' );
 
  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  nonzero = i4vec_nonzero_count ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nonzeroes: %d\n', nonzero );

  return
end

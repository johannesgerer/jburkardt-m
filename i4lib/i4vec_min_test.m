function i4vec_min_test ( )

%*****************************************************************************80
%
%% I4VEC_MIN_TEST tests I4VEC_MIN.
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
  fprintf ( 1, 'I4VEC_MIN_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_MIN: minimum entry;\n' );

  b = 1;
  c = 30;
  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  a_min = i4vec_min ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum: %d\n', a_min );
 
  return
end

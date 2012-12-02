function i4lib_test42 ( )

%*****************************************************************************80
%
%% TEST42 tests I4VEC_AMAX;
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
  fprintf ( 1, 'TEST42\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_AMAX:   maximum absolute entry;\n' );
 
  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  aval = i4vec_amax ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum absolute value: %f\n', aval );

  return
end

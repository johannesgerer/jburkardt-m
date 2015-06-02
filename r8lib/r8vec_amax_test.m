function r8vec_amax_test ( )

%*****************************************************************************80
%
%% R8VEC_AMAX_TEST tests R8VEC_AMAX;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_AMAX_TEST\n' );
  fprintf ( 1, '  For an R8VEC:\n' );
  fprintf ( 1, '  R8VEC_AMAX:      maximum magnitude entry;\n' );
 
  b = -n;
  c = n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  aval = r8vec_amax ( n, a );
  fprintf ( 1, '  Maximum absolute: %f\n', aval );

  return
end

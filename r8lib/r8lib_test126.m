function r8lib_test126 ( )

%*****************************************************************************80
%
%% TEST126 tests R8VEC_MAX and R8VEC_MIN.
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
  fprintf ( 1, 'TEST126\n' );
  fprintf ( 1, '  For an R8VEC:\n' );
  fprintf ( 1, '  R8VEC_MAX:       maximum entry;\n' );
  fprintf ( 1, '  R8VEC_MIN:       minimum entry.\n' );
 
  b = -n;
  c = n;

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  aval = r8vec_max ( n, a );
  fprintf ( 1, '  Maximum: %f\n', aval );

  aval = r8vec_min ( n, a );
  fprintf ( 1, '  Minimum: %f\n', aval );

  return
end

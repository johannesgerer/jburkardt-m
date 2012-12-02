function r8lib_test127 ( )

%*****************************************************************************80
%
%% TEST127 tests R8VEC_MAX_INDEX and R8VEC_MIN_INDEX.
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
  fprintf ( 1, 'TEST127\n' );
  fprintf ( 1, '  For an R8VEC:\n' );
  fprintf ( 1, '  R8VEC_MAX_INDEX: index of maximum entry;\n' );
  fprintf ( 1, '  R8VEC_MIN_INDEX: index of minimum entry;\n' );
 
  b = -n;
  c = n;

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  ival = r8vec_max_index ( n, a );
  fprintf ( 1, '  Maximum index: %d\n', ival );

  ival = r8vec_min_index ( n, a );
  fprintf ( 1, '  Minimum index: %d\n', ival );

  return
end

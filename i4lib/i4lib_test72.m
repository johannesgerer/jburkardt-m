function i4lib_test72 ( )

%*****************************************************************************80
%
%% TEST72 tests I4VEC_REVERSE.
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
  b = 0;
  c = 3 * n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST72\n' );
  fprintf ( 1, '  I4VEC_REVERSE reverses a list of integers.\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Original vector:' );

  a = i4vec_reverse ( n, a );

  i4vec_print ( n, a, '  Reversed:' );

  return
end

function c4lib_test29 ( )

%*****************************************************************************80
%
%% C4LIB_TEST29 tests C4MAT_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C4LIB_TEST29\n' );
  fprintf ( 1, '  C4MAT_UNIFORM_01 computes a "random" complex matrix.\n' );

  seed = 123456789;

  [ a, seed ] = c4mat_uniform_01 ( m, n, seed );

  c4mat_print ( m, n, a, '  The matrix:' );

  return
end

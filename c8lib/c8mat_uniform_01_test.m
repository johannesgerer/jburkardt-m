function c8mat_uniform_01_test ( )

%*****************************************************************************80
%
%% C8MAT_UNIFORM_01_TEST tests C8MAT_UNIFORM_01.
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
  fprintf ( 1, 'C8MAT_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  C8MAT_UNIFORM_01 computes a "random" complex matrix.\n' );

  seed = 123456789;

  [ a, seed ] = c8mat_uniform_01 ( m, n, seed );

  c8mat_print ( m, n, a, '  The matrix:' );

  return
end

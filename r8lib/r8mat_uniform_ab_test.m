function r8mat_uniform_ab_test ( )

%*****************************************************************************80
%
%% R8MAT_UNIFORM_AB_TEST tests R8MAT_UNIFORM_AB.
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
  m = 5;
  n = 4;
  b = 2.0;
  c = 10.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  R8MAT_UNIFORM_AB sets an R8MAT to random values in [A,B].\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = r8mat_uniform_ab ( m, n, b, c, seed );
%
%  Print out the matrix to be inverted.
%
  r8mat_print ( m, n, a, '  The random matrix:' );

  return
end

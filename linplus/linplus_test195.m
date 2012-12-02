function linplus_test195 ( )

%*****************************************************************************80
%
%% TEST195 tests R8CI_EVAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST195\n' );
  fprintf ( 1, '  R8CI_EVAL finds the eigenvalues of\n' );
  fprintf ( 1, '  a real circulant system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ci_random ( n, seed );

  r8ci_print ( n, a, '  The circulant matrix:' );

  lambda = r8ci_eval ( n, a );

  c8vec_print ( n, lambda, '  The eigenvalues:' );

  return
end

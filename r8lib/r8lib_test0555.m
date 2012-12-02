function linplus_test0555 ( )

%*****************************************************************************80
%
%% TEST0555 tests R8MAT_FSS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  nb = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0555\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8MAT_FSS factors and solves multiple linear systems.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
%
%  Set the desired solutions.
%
  x(1:n,1) = 1.0;
  x(1:n,2) = 1:n;
  x(1:n,3) = mod ( 0 : n - 1, 3 ) + 1;

  b(1:n,1:nb) = a(1:n,1:n) * x(1:n,1:nb);
%
%  Factor and solve the system.
%
  x = r8mat_fss ( n, a, nb, b );
 
  r8mat_print ( n, nb, x, '  Solution:' );

  return
end

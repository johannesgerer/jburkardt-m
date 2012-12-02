function linplus_test345 ( )

%*****************************************************************************80
%
%% TEST345 tests R8GE_FSS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  nb = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST345\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_FSS factors and solves multiple linear systems.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ge_random ( n, n, seed );
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
  x = r8ge_fss ( n, a, nb, b );
 
  r8ge_print ( n, nb, x, '  Solution:' );

  return
end

function r8mat_kronecker_test ( )

%*****************************************************************************80
%
%% R8MAT_KRONECKER_TEST tests R8MAT_KRONECKER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2013
%
%  Author:
%
%    John Burkardt
%
  m1 = 2;
  m2 = 3;
  m = m1 * m2;
  n1 = 3;
  n2 = 2;
  n = n1 * n2;

  a = [ ...
    1.0, 4.0; ...
    2.0, 5.0; ...
    3.0, 6.0 ]';
  b = [ ...
    7.0,  9.0, 11.0; ...
    8.0, 10.0, 12.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_KRONECKER_TEST\n' );
  fprintf ( 1, '  R8MAT_KRONECKER computes the Kronecker product\n' );
  fprintf ( 1, '  of two matrices.\n' );

  r8mat_print ( m1, n1, a, '  Factor matrix A:' );
  r8mat_print ( m2, n2, b, '  Factor matrix B:' );

  c = r8mat_kronecker ( m1, n1, a, m2, n2, b );

  r8mat_print ( m, n, c, '  Kronecker product C = kron(A,B)' );

  return
end

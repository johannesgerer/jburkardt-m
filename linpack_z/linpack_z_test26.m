function linpack_z_test26 ( )

%*****************************************************************************80
%
%% TEST26 tests ZPTSL.
%
%  Discussion:
%
%    ZPTSL factors and solves a Hermitian positive definite
%    tridiagonal system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST26\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian positive definite tridiagonal matrix (PT),\n' );
  fprintf ( 1, '  ZPTSL factors and solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the value of the superdiagonal and diagonal.
%
  e(1) = complex ( 2.1341, -0.2147 );
  e(2) = complex ( 2.0905,  1.1505 );
  e(3) = complex ( 0.0000,  0.0000 );

  d(1) = complex ( 4.5281,  0.0000 );
  d(2) = complex ( 5.0371,  0.0000 );
  d(3) = complex ( 4.7638,  0.0000 );
%
%  Set the right hand side.
%
  b(1) = complex (  8.7963, -0.4294 );
  b(2) = complex ( 18.4798,  3.6662 );
  b(3) = complex ( 18.4724, -2.3010 );
%
%  Factor and solve the system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix and solve the system.\n' );

  b = zptsl ( n, d, e, b );
%
%  Print the result.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution:\n' );
  fprintf ( 1, '  (Should be roughly (1,2,3)):\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  (%8f  %8f)\n', i, real ( b(i) ), imag ( b(i) ) );
  end

  return
end

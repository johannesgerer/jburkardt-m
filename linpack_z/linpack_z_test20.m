function linpack_z_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests ZPOCO.
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
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian positive definite matrix (PO),\n' );
  fprintf ( 1, '  ZPOCO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1,1) = complex ( 2.5281,  0.0000 );
  a(2,1) = complex ( 2.1341,  0.2147 );
  a(3,1) = complex ( 2.4187, -0.2932 );

  a(1,2) = complex ( 2.1341, -0.2147 );
  a(2,2) = complex ( 3.0371,  0.0000 );
  a(3,2) = complex ( 2.0905, -1.1505 );

  a(1,3) = complex ( 2.4187,  0.2932 );
  a(2,3) = complex ( 2.0905,  1.1505 );
  a(3,3) = complex ( 2.7638,  0.0000 );
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition.\n' );

  [ a, rcond, info ] = zpoco ( a, lda, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reciprocal condition  = %f\n', rcond );

  return
end

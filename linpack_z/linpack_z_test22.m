function linpack_z_test22 ( )

%*****************************************************************************80
%
%% TEST22 tests ZPOFA and ZPOSL.
%
%  Discussion:
%
%    ZPOFA factors a Hermitian positive definite matrix,
%    and ZPOSL can solve a factored linear system.
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
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian positive definite matrix (PO),\n' );
  fprintf ( 1, '  ZPOFA computes the LU factors.\n' );
  fprintf ( 1, '  ZPOSL solves a factored linear system.\n' );
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
%  Set the right hand side.
%
  for i = 1 : n
    x(i) = complex ( 2 * i - 1, 2 * i  );
  end

  b(1:n) = a(1:n,1:n) * transpose ( x(1:n) );
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = zpofa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, ZPOFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  b = zposl ( a, lda, n, b );
%
%  Print the result.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution:\n' );
  fprintf ( 1, '  (Should be (1+2i),(3+4i),(5+6i):\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  (%8f  %8f)\n', i, real ( b(i) ), imag ( b(i) ) );
  end

  return
end

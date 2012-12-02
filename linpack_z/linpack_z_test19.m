function linpack_z_test19 ( )

%*****************************************************************************80
%
%% TEST19 tests ZPBFA and ZPBSL.
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
  m = 1;
  lda = m+1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  positive definite hermitian band matrix (PB),\n' );
  fprintf ( 1, '  ZPBFA computes the LU factors.\n' );
  fprintf ( 1, '  ZPBSL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the value of the superdiagonal and diagonal.
%
  a(1,1) = complex ( 0.0000,  0.0000 );
  a(1,2) = complex ( 2.1341, -0.2147 );
  a(1,3) = complex ( 2.0905,  1.1505 );

  a(2,1) = complex ( 4.5281,  0.0000 );
  a(2,2) = complex ( 5.0371,  0.0000 );
  a(2,3) = complex ( 4.7638,  0.0000 );
%
%  Set the right hand side.
%
  b(1) = complex (  8.7963, -0.4294 );
  b(2) = complex ( 18.4798,  3.6662 );
  b(3) = complex ( 18.4724, -2.3010 );
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = zpbfa ( a, lda, n, m );

  if ( info ~= 0 )
    fprintf ( 1, '  Error!  ZPBFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  b = zpbsl ( a, lda, n, m, b );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution:\n' );
  fprintf ( 1, '  (Should be roughly (1,2,3)):\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  (%12f  %12f)\n', i, real ( b(i) ), imag ( b(i) ) );
  end

  return
end

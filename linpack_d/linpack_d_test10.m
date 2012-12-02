function linpack_d_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests DGEFA and DGESL.
%
%  Discussion:
%
%    Solve A*x = b where A is a given matrix, and B a right hand side.
%
%    We will also assume that A is stored in the simplest
%    possible way.
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
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  For a general matrix,\n' );
  fprintf ( 1, '  DGEFA computes the LU factors;\n' );
  fprintf ( 1, '  DGESL solves a factored linear system;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of equations is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a = [ 1.0, 2.0, 3.0;
        4.0, 5.0, 6.0;
        7.0, 8.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %12f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Set the values of the right hand side vector B.
%
  b(1:3) = [ 6.0, 15.0, 15.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The right hand side B is\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f\n', b(i) );
  end
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix\n' );

  [ a, ipvt, info ] = dgefa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '  DGEFA returned an error flag INFO = %d\n', info );
    return
  end
%
%  If no error occurred, now use DGESL to solve the system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  job = 0;
  b = dgesl ( a, lda, n, ipvt, b, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DGESL returns the solution:\n' );
  fprintf ( 1, '  (Should be (1,1,1))\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %12f\n', b(i) );
  end

  return
end
